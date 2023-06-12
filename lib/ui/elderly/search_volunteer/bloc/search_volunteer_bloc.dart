import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/gestures.dart';
import 'package:health_application/repository/elderly_appointment_repos.dart';
import 'package:health_application/ui/base/model/failure.dart';
import 'package:health_application/ui/elderly/search_volunteer/model/rating_res_model.dart';
import 'package:health_application/ui/elderly/search_volunteer/model/search_volunteer_model.dart';
import 'package:health_application/ui/elderly/search_volunteer/model/volunteer_detail_res.dart';
import 'package:health_application/ui/elderly/search_volunteer/model/volunteer_full_detail.dart';

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
      add(SearchVolunteer(search: SearchVolunteerModel()));
    }

    if (event is Changeview) {
      yield state.copyWith(searchVolunteerView: event.view);
    }

    if (event is SearchVolunteer) {
      yield state.copyWith(searchVolunteerSubmit: event.search);
      var res =
          await _elderlyAppointmentRepository.searchVolunteer(event.search);
      yield* res.fold((Failure err) async* {
        yield state.copyWith(searchRes: VolunteerDetailRes());
      }, (VolunteerDetailRes res) async* {
        yield state.copyWith(searchRes: res);
      });
    }
    if (event is GetDetailVolunteer) {
      var res =
          await _elderlyAppointmentRepository.searchVolunteerById(event.id);
      yield* res.fold((Failure err) async* {
        yield state.copyWith(
            currentVolunteerDetail: VolunteerFullDetail(),
            status: SearchStatus.getDetailFail);
      }, (VolunteerFullDetail res) async* {
        var review = await _elderlyAppointmentRepository.searchReview(event.id);
        yield* review.fold((Failure err) async* {
          yield state.copyWith(
              currentVolunteerDetail: res,
              reviews: RatingResModel(),
              status: SearchStatus.getDetailFail);
        }, (RatingResModel review) async* {
          yield state.copyWith(
              currentVolunteerDetail: res,
              reviews: review,
              searchVolunteerView: SearchVolunteerView.volunteerDetail);
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
