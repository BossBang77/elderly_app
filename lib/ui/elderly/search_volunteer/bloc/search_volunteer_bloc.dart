import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:health_application/repository/elderly_appointment_repos.dart';
import 'package:health_application/ui/base/model/failure.dart';
import 'package:health_application/ui/base/user_secure_storage.dart';
import 'package:health_application/ui/elderly/search_volunteer/model/appointment/create_appointment.dart';
import 'package:health_application/ui/elderly/search_volunteer/model/avaliable_time/avaliable_data.dart';
import 'package:health_application/ui/elderly/search_volunteer/model/rating_res_model.dart';
import 'package:health_application/ui/elderly/search_volunteer/model/search_volunteer_model.dart';
import 'package:health_application/ui/elderly/search_volunteer/model/volunteer_detail_res.dart';
import 'package:health_application/ui/elderly/search_volunteer/model/volunteer_full_detail.dart';
import 'package:health_application/ui/extension/date_extension.dart';
import 'package:health_application/ui/google_map/locationsModel.dart';

import '../model/appointment/code_model.dart';
import '../model/appointment_detail/appointment_list.dart';

part 'search_volunteer_event.dart';
part 'search_volunteer_state.dart';

class SearchVolunteerBloc
    extends Bloc<SearchVolunteerEvent, SearchVolunteerState> {
  SearchVolunteerBloc() : super(SearchVolunteerInitial()) {}

  ElderlyAppointmentRepository _elderlyAppointmentRepository =
      ElderlyAppointmentRepository();

  @override
  Stream<SearchVolunteerState> mapEventToState(
      SearchVolunteerEvent event) async* {
    if (event is Intital) {
      var recentlyList =
          await UserSecureStorage().getRecentlyVolunteerSearched();
      if (!event.ispop) {
        yield SearchVolunteerState();
      }

      yield state.copyWith(recentlyList: recentlyList);
      add(SearchVolunteer(search: SearchVolunteerModel()));
      add(SearchCompleteAppointment(elderlyId: event.elderlyId));
    }

    if (event is Changeview) {
      yield state.copyWith(searchVolunteerView: event.view);
    }

    if (event is SearchVolunteer) {
      yield state.copyWith(isLoading: true);
      yield state.copyWith(searchVolunteerSubmit: event.search);
      var res =
          await _elderlyAppointmentRepository.searchVolunteer(event.search);
      yield* res.fold((Failure err) async* {
        yield state.copyWith(searchRes: VolunteerDetailRes(), isLoading: false);
      }, (VolunteerDetailRes res) async* {
        yield state.copyWith(searchRes: res, isLoading: false);
      });
    }
    if (event is GetDetailVolunteer) {
      yield state.copyWith(isLoading: true);
      var res =
          await _elderlyAppointmentRepository.searchVolunteerById(event.id);
      yield* res.fold((Failure err) async* {
        yield state.copyWith(
            currentVolunteerDetail: VolunteerFullDetail(),
            status: SearchStatus.getDetailFail,
            isLoading: false);
      }, (VolunteerFullDetail res) async* {
        var review = await _elderlyAppointmentRepository.searchReview(event.id,
            limit: '10');
        yield* review.fold((Failure err) async* {
          yield state.copyWith(
              currentVolunteerDetail: res,
              reviews: RatingResModel(),
              status: SearchStatus.getDetailFail,
              isLoading: false);
        }, (RatingResModel review) async* {
          yield state.copyWith(
              currentVolunteerDetail: res,
              reviews: review,
              currentVolunteerUid: event.id,
              createAppointment: CreateAppointmentModel(),
              searchVolunteerView: SearchVolunteerView.volunteerDetail,
              isLoading: false);
        });
      });
    }
    if (event is OnFilter) {
      yield mapFilter(event);
    }

    if (event is ReviewSort) {
      yield state.copyWith(reviewSort: event.sort);
    }

    if (event is UpdateSearchStatus) {
      yield state.copyWith(status: event.status);
    }
    if (event is MapCreateAppointment) {
      yield mapCreateAppointment(event);
    }

    if (event is IntialAppointment) {
      yield state.copyWith(createAppointment: CreateAppointmentModel());
    }

    if (event is AcceptAppointment) {
      /// Mapping uid
      var createObj = state.createAppointment;
      var volunteer = createObj.volunteer;
      var elderly = createObj.elderly;
      volunteer = volunteer.copyWith(profileId: state.currentVolunteerUid);
      elderly = elderly.copyWith(profileId: event.elderltId);
      createObj = createObj.copyWith(volunteer: volunteer, elderly: elderly);
      yield state.copyWith(createAppointment: createObj);
      var createRes = await _elderlyAppointmentRepository
          .createAppointment(state.createAppointment);
      yield* createRes.fold((Failure err) async* {
        yield state.copyWith(status: SearchStatus.createAppointmentFail);
      }, (String res) async* {
        yield state.copyWith(status: SearchStatus.createAppointSuccess);
      });
    }

    if (event is SearchCompleteAppointment) {
      var searchAppointList =
          await _elderlyAppointmentRepository.getAppointList(
              elderlyProfileId: event.elderlyId,
              include: AppointStatus.COMPLETE.name);

      yield* searchAppointList.fold((Failure err) async* {
        yield state.copyWith(lastestAppointList: AppointList());
      }, (AppointList res) async* {
        yield state.copyWith(lastestAppointList: res);
      });
    }

    if (event is GetAvaliableTime) {
      yield state.copyWith(isLoading: true);
      String? date = event.date!.toDisplayApiFormat();
      var searchAppointList = await _elderlyAppointmentRepository
          .getAvaliableTime(state.currentVolunteerUid, date);

      yield* searchAppointList.fold((Failure err) async* {
        yield state.copyWith(avaliableTime: AvaliableData(), isLoading: false);
      }, (AvaliableData res) async* {
        yield state.copyWith(avaliableTime: res, isLoading: false);
      });
    }

    if (event is UpdateSelectMonth) {
      yield state.copyWith(currentMonth: event.date);
    }

    if (event is SubmitSearchKeyWord) {
      yield state.copyWith(isLoading: true);
      List<String> recently = state.recentlyList;
      if (event.keyWord.isNotEmpty && (!recently.contains(event.keyWord))) {
        recently.add(event.keyWord);
        await UserSecureStorage().setRecentlyVolunteerSearched(recently);
        var recentlyList =
            await UserSecureStorage().getRecentlyVolunteerSearched();
        yield state.copyWith(recentlyList: recentlyList, isLoading: false);
      }
    }
  }

  SearchVolunteerState mapFilter(OnFilter event) {
    var search = state.searchVolunteer;
    var rateList = [...search.ratings];
    switch (event.type) {
      case FilterType.keyword:
        search = search.copyWith(keyword: event.value);
        break;
      case FilterType.addRate:
        rateList.add(event.value);
        search = search.copyWith(ratings: rateList);
        break;
      case FilterType.delRate:
        rateList.remove(event.value);
        search = search.copyWith(ratings: rateList);
        break;
      case FilterType.experient:
        search = search.copyWith(maxExperience: event.value);
        break;
      case FilterType.gender:
        search = search.copyWith(gender: event.value);
        break;
      case FilterType.maxAge:
        search = search.copyWith(maxAge: event.value);
        break;
      case FilterType.minAge:
        search = search.copyWith(minAge: event.value);
        break;
      case FilterType.reset:
        search = SearchVolunteerModel();
        break;
      default:
    }

    return state.copyWith(searchVolunteer: search);
  }

  SearchVolunteerState mapCreateAppointment(MapCreateAppointment event) {
    var createObj = state.createAppointment;
    var type = [...createObj.types];
    var time = [...createObj.appointmentTimes];
    var volunteer = createObj.volunteer;
    var elderly = createObj.elderly;

    switch (event.createObj) {
      case CreateAppointObj.addAppointmentTimes:
        time.add(CodeModel(code: event.value));
        createObj = createObj.copyWith(appointmentTimes: time);
        break;
      case CreateAppointObj.delAppointmentTimes:
        time.removeWhere((item) => item.code == event.value);
        createObj = createObj.copyWith(appointmentTimes: time);
        break;
      case CreateAppointObj.addType:
        type.add(CodeModel(code: event.value));
        createObj = createObj.copyWith(types: type);
        break;
      case CreateAppointObj.delType:
        type.removeWhere((item) => item.code == event.value);
        createObj = createObj.copyWith(types: type);
        break;
      case CreateAppointObj.note:
        createObj = createObj.copyWith(note: event.value);
        break;
      case CreateAppointObj.appointmentDate:
        createObj = createObj.copyWith(appointmentDate: event.value);
        break;
      case CreateAppointObj.address:
        Locations _locations = event.value;
        createObj = createObj.copyWith(
            addressFull: _locations.nameAddress,
            latitude: _locations.latitude,
            longitude: _locations.longtitude);
        break;

      case CreateAppointObj.volunteerId:
        volunteer = volunteer.copyWith(profileId: event.value);
        createObj = createObj.copyWith(volunteer: volunteer);
        break;
      case CreateAppointObj.elderlyId:
        elderly = elderly.copyWith(profileId: event.value);
        createObj = createObj.copyWith(elderly: elderly);
        break;
      case CreateAppointObj.clearTime:
        time = [];
        createObj = createObj.copyWith(appointmentTimes: time);
        break;
      default:
    }

    return state.copyWith(createAppointment: createObj);
  }

  Locations _locations = Locations();
  Future<bool> initialState() async {
    await _locations.getCurrentUserLocation();
    Locations locations = Locations(
        latitude: _locations.latitude,
        longtitude: _locations.longtitude,
        nameAddress: _locations.nameAddress);
    String initDate = DateTime.now().toDisplayApiFormat();
    add(MapCreateAppointment(
        createObj: CreateAppointObj.address, value: locations));
    add(MapCreateAppointment(
        createObj: CreateAppointObj.appointmentDate, value: initDate));
    add(GetAvaliableTime(date: DateTime.now()));
    add(UpdateSelectMonth(date: DateTime.now()));
    return true;
  }
}

bool checkIsFilter(SearchVolunteerModel currentSearch) {
  bool filter = false;
  if (currentSearch.keyword.isNotEmpty ||
      currentSearch.gender.isNotEmpty ||
      currentSearch.maxAge != 0 ||
      currentSearch.minAge != 0 ||
      currentSearch.maxExperience != 0 ||
      currentSearch.ratings.isNotEmpty) {
    filter = true;
  }

  return filter;
}
