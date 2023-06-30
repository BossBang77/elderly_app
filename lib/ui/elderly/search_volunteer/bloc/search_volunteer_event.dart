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
  final String elderlyId;
  final bool ispop;
  const Intital({this.elderlyId = '', this.ispop = false});
  @override
  List<Object> get props => [elderlyId];
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

class MapCreateAppointment extends SearchVolunteerEvent {
  final CreateAppointObj createObj;
  final dynamic value;
  const MapCreateAppointment({required this.createObj, this.value = ''});
  @override
  List<Object> get props => [createObj, value];
}

class IntialAppointment extends SearchVolunteerEvent {
  const IntialAppointment();
}

class AcceptAppointment extends SearchVolunteerEvent {
  final String elderltId;
  const AcceptAppointment({required this.elderltId});
  @override
  List<Object> get props => [elderltId];
}

class SearchCompleteAppointment extends SearchVolunteerEvent {
  final String elderlyId;
  const SearchCompleteAppointment({required this.elderlyId});
  @override
  List<Object> get props => [elderlyId];
}

class GetAvaliableTime extends SearchVolunteerEvent {
  final DateTime? date;

  GetAvaliableTime({this.date = null});
  @override
  List<Object> get props => [date!];
}

class UpdateSelectMonth extends SearchVolunteerEvent {
  final DateTime? date;

  UpdateSelectMonth({this.date = null});
  @override
  List<Object> get props => [date!];
}

class SubmitSearchKeyWord extends SearchVolunteerEvent {
  final String keyWord;

  const SubmitSearchKeyWord({required this.keyWord});
  @override
  List<Object> get props => [keyWord];
}
