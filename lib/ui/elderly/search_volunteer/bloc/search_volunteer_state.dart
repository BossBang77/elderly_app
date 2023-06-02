part of 'search_volunteer_bloc.dart';

class SearchVolunteerState extends Equatable {
  const SearchVolunteerState(
      {this.searchVolunteerView = SearchVolunteerView.searchSummary});
  final SearchVolunteerView searchVolunteerView;

  SearchVolunteerState copyWith({SearchVolunteerView? searchVolunteerView}) {
    return SearchVolunteerState(
        searchVolunteerView: searchVolunteerView ?? this.searchVolunteerView);
  }

  @override
  List<Object> get props => [searchVolunteerView];
}

class SearchVolunteerInitial extends SearchVolunteerState {}

enum SearchVolunteerView {
  searchSummary,
  searchResult,
  volunteerDetail,
  AppointVolunteer
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
