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
      this.status = SearchStatus.initial});
  final SearchVolunteerView searchVolunteerView;
  final SearchVolunteerModel searchVolunteerSubmit;
  final SearchVolunteerModel searchVolunteer;
  final VolunteerDetailRes searchRes;
  final VolunteerFullDetail currentVolunteerDetail;
  final RatingResModel reviews;
  final int reviewSort;
  final SearchStatus status;

  SearchVolunteerState copyWith(
      {SearchVolunteerView? searchVolunteerView,
      SearchVolunteerModel? searchVolunteer,
      SearchVolunteerModel? searchVolunteerSubmit,
      VolunteerDetailRes? searchRes,
      VolunteerFullDetail? currentVolunteerDetail,
      RatingResModel? reviews,
      int? reviewSort,
      SearchStatus? status}) {
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
        status: status ?? this.status);
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
        status
      ];
}

class SearchVolunteerInitial extends SearchVolunteerState {}

enum SearchVolunteerView {
  searchSummary,
  searchResult,
  volunteerDetail,
  AppointVolunteer,
}

var appointType = ['ดูแลผู้สูงอายุ', 'ทำกายภาพบำบัด', 'พาไปนอกสถานที่'];
var timeLength = [
  '08:00 - 09:00 น.',
  '09:00 - 10:00 น.',
  '10:00 - 11:00 น.',
  '11:00 - 12:00 น.',
  '12:00 - 13:00 น.',
  '13:00 - 14:00 น.',
  '14:00 - 15:00 น.',
  '15:00 - 16:00 น.',
  '16:00 - 17:00 น.',
  '17:00 - 18:00 น.'
];

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

enum SearchStatus { initial, getDetailFail, getDetailSuccess }
