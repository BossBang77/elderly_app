part of 'search_volunteer_bloc.dart';

abstract class SearchVolunteerEvent extends Equatable {
  const SearchVolunteerEvent();

  @override
  List<Object> get props => [];
}

class Changeview extends SearchVolunteerEvent {
  final SearchVolunteerView view;
  const Changeview({required this.view});
  @override
  List<Object> get props => [view];
}

class SearchVolunteer extends SearchVolunteerEvent {
  final SearchVolunteerModel search;
  const SearchVolunteer({required this.search});
  @override
  List<Object> get props => [search];
}

class Intital extends SearchVolunteerEvent {
  const Intital();
}

class GetDetailVolunteer extends SearchVolunteerEvent {
  final String id;
  const GetDetailVolunteer({this.id = ''});

  @override
  List<Object> get props => [id];
}

class OnFilter extends SearchVolunteerEvent {
  final FilterType type;
  final dynamic value;
  const OnFilter({required this.type, this.value = ''});
  @override
  List<Object> get props => [type, value];
}

class ReviewSort extends SearchVolunteerEvent {
  final int sort;
  const ReviewSort({this.sort = 0});
  @override
  List<Object> get props => [sort];
}

class UpdateSearchStatus extends SearchVolunteerEvent {
  final SearchStatus status;
  const UpdateSearchStatus({this.status = SearchStatus.initial});
  @override
  List<Object> get props => [status];
}
