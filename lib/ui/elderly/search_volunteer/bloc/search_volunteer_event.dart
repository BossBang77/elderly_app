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
