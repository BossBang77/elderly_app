import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:health_application/repository/master_data_repos.dart';
import 'package:health_application/ui/base/model/master_data.dart';
import 'package:health_application/ui/base/model/master_data_detail.dart';
part 'master_data_event.dart';
part 'master_data_state.dart';

class MasterDataBloc extends Bloc<MasterDataEvent, MasterDataState> {
  MasterDataBloc() : super(MasterDataInitial()) {}
  final MasterDataRepository _masterDataRepository = MasterDataRepository();
  @override
  Stream<MasterDataState> mapEventToState(MasterDataEvent event) async* {
    if (event is LoadMasterData) {
      var masterDisease = await _masterDataRepository
          .loadMasterData(MasterCategory().congenitalDisease);
      var masterAllergies = await _masterDataRepository
          .loadMasterData(MasterCategory().allergies);

      yield* masterDisease.fold((error) async* {
        // case fail

        yield state.copyWith(congenitalDiseaseMaster: const MasterData());
      }, (MasterData master) async* {
        yield state.copyWith(congenitalDiseaseMaster: master);
      });

      yield* masterAllergies.fold((error) async* {
        // case fail

        yield state.copyWith(allergiesMaster: const MasterData());
      }, (MasterData master) async* {
        yield state.copyWith(allergiesMaster: master);
      });
    }
  }
}
