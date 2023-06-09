import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:health_application/repository/register_repos.dart';

part 'volunteer_register_event.dart';
part 'volunteer_register_state.dart';

class VolunteerRegisterBloc
    extends Bloc<VolunteerRegisterEvent, VolunteerRegisterState> {
  VolunteerRegisterBloc() : super(VolunteerRegisterState.initial()) {}
  final RegisterRepository _registerRepository = RegisterRepository();

  @override
  Stream<VolunteerRegisterState> mapEventToState(
      VolunteerRegisterEvent event) async* {
    if (event is UpdateValue) {
      switch (event.type) {
        case FormFieldType.name:
          yield state.copyWth(name: event.value);
          break;
        case FormFieldType.cid:
          yield state.copyWth(cid: event.value);
          break;
        case FormFieldType.sex:
          yield state.copyWth(sex: event.value);
          break;
        case FormFieldType.birthDate:
          yield state.copyWth(birthDate: event.value);
          break;
      }
    }

    if (event is RegisterProfile) {}
  }
}
