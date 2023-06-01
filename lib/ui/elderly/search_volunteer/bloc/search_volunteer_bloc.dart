import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/gestures.dart';

part 'search_volunteer_event.dart';
part 'search_volunteer_state.dart';

class SearchVolunteerBloc
    extends Bloc<SearchVolunteerEvent, SearchVolunteerState> {
  SearchVolunteerBloc() : super(SearchVolunteerInitial()) {}
  @override
  Stream<SearchVolunteerState> mapEventToState(
      SearchVolunteerEvent event) async* {
    if (event is Changeview) {
      yield state.copyWith(searchVolunteerView: event.view);
    }
  }
}
