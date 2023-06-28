import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'elderly_setting_event.dart';
part 'elderly_setting_state.dart';

class ElderlySettingBloc
    extends Bloc<ElderlySettingEvent, ElderlySettingState> {
  ElderlySettingBloc() : super(ElderlySettingInitial()) {
    on<ElderlySettingEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
