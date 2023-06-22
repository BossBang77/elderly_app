import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'elderly_address_event.dart';
part 'elderly_address_state.dart';

class ElderlyAddressBloc
    extends Bloc<ElderlyAddressEvent, ElderlyAddressState> {
  ElderlyAddressBloc() : super(ElderlyAddressInitial()) {
    on<ElderlyAddressEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
