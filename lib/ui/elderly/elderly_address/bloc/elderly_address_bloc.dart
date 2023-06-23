import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/elderly/elderly_address/model/location_model.dart';

part 'elderly_address_event.dart';
part 'elderly_address_state.dart';

class ElderlyAddressBloc
    extends Bloc<ElderlyAddressEvent, ElderlyAddressState> {
  ElderlyAddressBloc() : super(ElderlyAddressInitial()) {
    on<ElderlyAddressEvent>((event, emit) {
      if (event is LocationChange) {
        LocationModel locate = event.location;
        emit(state.copyWith(location: locate));
      }
      if (event is onAcceptLocation) {}

      if (event is ManageAddress) {
        emit(state.copyWith(manageType: event.type));
      }
    });
  }
}
