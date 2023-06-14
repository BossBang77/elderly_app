part of 'search_volunteer_bloc.dart';

class SearchVolunteerState extends Equatable {
  const SearchVolunteerState(
      {this.searchVolunteerView = SearchVolunteerView.searchSummary,
      this.searchVolunteer = const SearchVolunteerModel(),
      this.searchVolunteerSubmit = const SearchVolunteerModel(),
      this.searchRes = const VolunteerDetailRes(),
      this.currentVolunteerDetail = const VolunteerFullDetail(),
      this.reviews = const RatingResModel(),
      this.reviewSort = 0,
      this.status = SearchStatus.initial,
      this.createAppointment = const CreateAppointmentModel(),
      this.currentVolunteerUid = '',
      this.lastestAppointList = const AppointList(),
      this.avaliableTime = const AvaliableData()});
  final SearchVolunteerView searchVolunteerView;
  final SearchVolunteerModel searchVolunteerSubmit;
  final SearchVolunteerModel searchVolunteer;
  final VolunteerDetailRes searchRes;
  final VolunteerFullDetail currentVolunteerDetail;
  final RatingResModel reviews;
  final int reviewSort;
  final SearchStatus status;
  final CreateAppointmentModel createAppointment;
  final String currentVolunteerUid;
  final AppointList lastestAppointList;
  final AvaliableData avaliableTime;

  SearchVolunteerState copyWith(
      {SearchVolunteerView? searchVolunteerView,
      SearchVolunteerModel? searchVolunteer,
      SearchVolunteerModel? searchVolunteerSubmit,
      VolunteerDetailRes? searchRes,
      VolunteerFullDetail? currentVolunteerDetail,
      RatingResModel? reviews,
      int? reviewSort,
      SearchStatus? status,
      CreateAppointmentModel? createAppointment,
      String? currentVolunteerUid,
      AppointList? lastestAppointList,
      AvaliableData? avaliableTime}) {
    return SearchVolunteerState(
        searchVolunteerView: searchVolunteerView ?? this.searchVolunteerView,
        searchVolunteer: searchVolunteer ?? this.searchVolunteer,
        searchVolunteerSubmit:
            searchVolunteerSubmit ?? this.searchVolunteerSubmit,
        searchRes: searchRes ?? this.searchRes,
        currentVolunteerDetail:
            currentVolunteerDetail ?? this.currentVolunteerDetail,
        reviews: reviews ?? this.reviews,
        reviewSort: reviewSort ?? this.reviewSort,
        status: status ?? this.status,
        createAppointment: createAppointment ?? this.createAppointment,
        currentVolunteerUid: currentVolunteerUid ?? this.currentVolunteerUid,
        lastestAppointList: lastestAppointList ?? this.lastestAppointList,
        avaliableTime: avaliableTime ?? this.avaliableTime);
  }

  @override
  List<Object> get props => [
        searchVolunteerView,
        searchVolunteer,
        searchVolunteerSubmit,
        searchRes,
        currentVolunteerDetail,
        reviews,
        reviewSort,
        status,
        createAppointment,
        currentVolunteerUid,
        lastestAppointList,
        avaliableTime
      ];
}

class SearchVolunteerInitial extends SearchVolunteerState {}

enum SearchVolunteerView {
  searchSummary,
  searchResult,
  volunteerDetail,
  AppointVolunteer,
}

enum FilterType {
  keyword,
  gender,
  experient,
  minAge,
  maxAge,
  addRate,
  delRate,
  reset
}

enum CreateAppointObj {
  addType,
  delType,
  appointmentDate,
  addAppointmentTimes,
  delAppointmentTimes,
  note,
  address,
  elderlyId,
  volunteerId
}

enum SearchStatus {
  initial,
  getDetailFail,
  getDetailSuccess,
  createAppointSuccess,
  createAppointmentFail
}

enum AppointStatus { CREATE, WAITING_TO_START, START, COMPLETE, REJECT }
