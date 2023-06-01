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

enum SearchVolunteerView { searchSummary, searchResult, volunteerDetail }
