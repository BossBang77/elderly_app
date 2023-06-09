import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:health_application/repository/exercise_repos.dart';
import 'package:health_application/ui/base/app_config/conflig.dart';
import 'package:health_application/ui/base/model/failure.dart';
import 'package:health_application/ui/elderly/exercise/model/daily_activity_req_model.dart';
import 'package:health_application/ui/elderly/exercise/model/exercise_model.dart';
import 'package:health_application/ui/elderly/exercise/model/search_exercise_model.dart';
import 'package:health_application/ui/elderly/exercise/model/search_information.dart';
import 'package:health_application/ui/elderly/exercise/model/search_res_list.dart';
import 'package:health_application/ui/elderly/exercise/model/search_res_model.dart';
import 'package:health_application/ui/register_profile/bloc/register_profile_bloc.dart';

import '../model/exerise_daily_model.dart';

part 'exercise_event.dart';
part 'exercise_state.dart';

class ExerciseBloc extends Bloc<ExerciseEvent, ExerciseState> {
  ExerciseBloc() : super(ExerciseState.initial()) {}
  ExerciseRepository _exerciseRepository = ExerciseRepository();

  @override
  Stream<ExerciseState> mapEventToState(ExerciseEvent event) async* {
    if (event is Initial) {
      yield ExerciseState.initial();
      add(GetExerciseDaily());
      add(GetExerciseRecord());
    }
    if (event is ChangeView) {
      yield state.copyWith(exerciseView: event.exerciseView);
    }

    if (event is ExerciseVdoFinish) {
      yield state.copyWith(
          timeExercise: event.time, exerciseView: ExerciseView.calculate);
    }
    if (event is SearchExercise) {
      var currentSearch = state.searchEx;
      yield state.copyWith(searchExSubmit: currentSearch);
      var res = await _exerciseRepository.searchExercise(state.searchExSubmit);
      yield* res.fold((l) async* {
        yield state.copyWith(searchRes: SearchResListModel());
      }, (SearchResListModel res) async* {
        yield state.copyWith(searchRes: res);
      });
    }
    if (event is OnFilter) {
      yield onFilter(event);
    }

    if (event is SearchExInformation) {
      var res = await _exerciseRepository.getExerciseInformation(event.exCode);
      yield* res.fold((Failure err) async* {
        yield state.copyWith(
            currentInformation: SearchInformationModel(),
            statusSubmit: StatusSubmit.getInformationFail,
            statusView: event.statusViewExercise);
      }, (SearchInformationModel res) async* {
        yield state.copyWith(
            exerciseView: ExerciseView.exerciseDetail,
            currentInformation: res,
            statusSubmit: StatusSubmit.getInformationSuccess,
            statusView: event.statusViewExercise);
      });
    }

    if (event is UpdateSubmitStatus) {
      yield state.copyWith(statusSubmit: event.status);
    }

    if (event is GetExerciseDaily) {
      var res = await _exerciseRepository.getExerciseDaily();
      yield* res.fold((Failure err) async* {
        yield state.copyWith(exerciseDaily: ExerciseDailyModel());
      }, (ExerciseDailyModel res) async* {
        yield state.copyWith(exerciseDaily: res);
      });
    }

    if (event is RemoveExerciseRecord) {
      var res = await _exerciseRepository.removeExerciseRecord(event.id);
      yield* res.fold((Failure err) async* {
        yield state.copyWith(
            statusSubmit: StatusSubmit.removeExerciseRecordFail);
      }, (int res) async* {
        yield state.copyWith(
            statusSubmit: StatusSubmit.removeExerciseRecordSuccess);
        add(GetExerciseRecord());
      });
    }

    if (event is GetExerciseRecord) {
      var res = await _exerciseRepository.getExerciseRecord();
      yield* res.fold((Failure err) async* {
        yield state.copyWith(recordList: SearchResListModel());
      }, (SearchResListModel res) async* {
        yield state.copyWith(recordList: res);
      });
    }

    if (event is SaveExerciseRecord) {
      ExerciseModel newActivity =
          ExerciseModel(name: event.name, code: event.code);
      List<SearchResModel> reccordList = state.recordList.data;
      List<ExerciseModel> bodyReq = [];
      reccordList.forEach((recorded) {
        bodyReq.add(ExerciseModel(code: recorded.code, name: recorded.name));
      });
      bodyReq.add(newActivity);
      var res = await _exerciseRepository.saveExerciseRecord(bodyReq);
      yield* res.fold((Failure err) async* {
        yield state.copyWith(statusSubmit: StatusSubmit.saveRecordFail);
      }, (String res) async* {
        yield state.copyWith(
          statusSubmit: StatusSubmit.saveRecordSuccess,
        );
      });
    }

    if (event is SaveExerciseRecordBeforeExerise) {
      ExerciseModel newActivity =
          ExerciseModel(name: event.name, code: event.code);
      List<SearchResModel> reccordList = state.recordList.data;
      List<ExerciseModel> bodyReq = [];
      reccordList.forEach((recorded) {
        bodyReq.add(ExerciseModel(code: recorded.code, name: recorded.name));
      });
      bodyReq.add(newActivity);
      var res = await _exerciseRepository.saveExerciseRecord(bodyReq);
      yield* res.fold((Failure err) async* {
        yield state.copyWith(statusSubmit: StatusSubmit.saveRecordFail);
      }, (String res) async* {
        yield state.copyWith(exerciseView: ExerciseView.vdoExercise);
      });
    }

    if (event is SaveExerciseDaily) {
      num burnCalorie =
          calBurnCalorie(event.timePoint, state.currentInformation);

      DailyActivityModel dailyMol = DailyActivityModel(
          burnCaloriePoint: burnCalorie,
          timePoint: (double.tryParse(event.timePoint) ?? 0).ceil());

      var res = await _exerciseRepository.saveExerciseDaily(dailyMol);
      yield* res.fold((Failure err) async* {
        yield state.copyWith(statusSubmit: StatusSubmit.saveExerciseDailyFail);
      }, (int res) async* {
        yield state.copyWith(
          statusSubmit: StatusSubmit.saveExerciseDailySuccess,
        );
      });
    }
  }

  ExerciseState onFilter(OnFilter event) {
    var searchMaster = state.searchEx;
    var listType = [...searchMaster.type];

    switch (event.type) {
      case FilterType.keyWord:
        searchMaster = searchMaster.copyWith(keyword: event.value);
        return state.copyWith(searchEx: searchMaster);

      case FilterType.maxKcal:
        searchMaster = searchMaster.copyWith(
            burnCalorieMax: int.tryParse(event.value) ?? 0);
        return state.copyWith(searchEx: searchMaster);

      case FilterType.minKcal:
        searchMaster = searchMaster.copyWith(
            burnCalorieMin: int.tryParse(event.value) ?? 0);
        return state.copyWith(searchEx: searchMaster);

      case FilterType.addTypeExcercise:
        listType.add(event.value);
        searchMaster = searchMaster.copyWith(type: listType);
        return state.copyWith(searchEx: searchMaster);

      case FilterType.delTypeExcercise:
        listType.removeWhere((element) => element == event.value);
        searchMaster = searchMaster.copyWith(type: listType);
        return state.copyWith(searchEx: searchMaster);

      case FilterType.resetFilter:
        searchMaster = SearchExerciseModel().empty;
        return state.copyWith(searchEx: searchMaster);

      default:
        return state;
    }
  }
}

bool checkIsFilter(SearchExerciseModel currentSearch) {
  bool filter = false;
  if (currentSearch.keyword.isNotEmpty ||
      currentSearch.type.isNotEmpty ||
      currentSearch.burnCalorieMax != 0 ||
      currentSearch.burnCalorieMin != 0) {
    filter = true;
  }

  return filter;
}

bool checkIsSaveRecord(SearchResListModel recordList, String code) {
  var isSelect = recordList.data.firstWhere(
    (element) => element.code == code,
    orElse: () => SearchResModel(),
  );

  /// check has select this exercise
  return isSelect.code.isNotEmpty;
}

int calBurnCalorie(
    String timePointEx, SearchInformationModel currentInformation) {
  int burnCalorie = 0;
  int timePoint = (double.tryParse(timePointEx) ?? 0).ceil();
  var exCurrent = currentInformation;
  if (exCurrent.time != 0) {
    double oneMinBurn = (exCurrent.burnCalorie / exCurrent.time);
    burnCalorie = (oneMinBurn * timePoint).ceil().toInt();
  }
  return burnCalorie;
}