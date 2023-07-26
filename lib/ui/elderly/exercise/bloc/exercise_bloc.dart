import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:health_application/repository/exercise_repos.dart';
import 'package:health_application/ui/base/app_config/conflig.dart';
import 'package:health_application/ui/base/model/failure.dart';
import 'package:health_application/ui/base/user_secure_storage.dart';
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
      yield state.copyWith(loading: true);
      var recentlyList =
          await UserSecureStorage().getRecentlyExerciseSearched();
      var roleList = await UserSecureStorage().getRole();

      String role = roleList.isNotEmpty ? roleList.first.role : '';
      if (role == RoleType.ROLE_USER_VOLUNTEER.name) {
        yield state.copyWith(
            exerciseView: ExerciseView.search,
            role: role,
            recentlyList: recentlyList,
            loading: false);
        add(SearchExercise());
      } else {
        yield state.copyWith(recentlyList: recentlyList, loading: false);
        add(GetExerciseDaily());
        add(GetExerciseRecord());
      }
    }
    if (event is ChangeView) {
      yield state.copyWith(exerciseView: event.exerciseView);
    }

    if (event is ExerciseVdoFinish) {
      yield state.copyWith(
          timeExercise: event.time,
          timeExerciseInSec: event.inSeconds,
          exerciseView: ExerciseView.calculate);
    }
    if (event is SearchExercise) {
      yield state.copyWith(loading: true);
      var currentSearch = state.searchEx;
      yield state.copyWith(searchExSubmit: currentSearch);
      var res = await _exerciseRepository.searchExercise(state.searchExSubmit);
      yield* res.fold((l) async* {
        yield state.copyWith(searchRes: SearchResListModel(), loading: false);
      }, (SearchResListModel res) async* {
        yield state.copyWith(searchRes: res, loading: false);
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
        add(GetExerciseDaily());
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

    if (event is SaveExerciseDaily) {
      num burnCalorie =
          calBurnCalorie(event.timePointInSec, state.currentInformation);

      DailyActivityModel dailyMol = DailyActivityModel(
          burnCaloriePoint: burnCalorie,
          timePoint: (double.tryParse(event.timePoint) ?? 0),
          name: event.name,
          code: event.code);

      var res = await _exerciseRepository.saveExerciseDaily(dailyMol);
      yield* res.fold((Failure err) async* {
        yield state.copyWith(statusSubmit: StatusSubmit.saveExerciseDailyFail);
      }, (int res) async* {
        yield state.copyWith(
          statusSubmit: StatusSubmit.saveExerciseDailySuccess,
        );
      });
    }

    if (event is SubmitSearchKeyWord) {
      List<String> recently = state.recentlyList;
      if (event.keyWord.isNotEmpty && (!recently.contains(event.keyWord))) {
        recently.add(event.keyWord);
        await UserSecureStorage().setRecentlyExerciseSearched(recently);
        var recentlyList =
            await UserSecureStorage().getRecentlyExerciseSearched();
        yield state.copyWith(recentlyList: recentlyList);
      }
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

double calBurnCalorie(
    int timePointSec, SearchInformationModel currentInformation) {
  double burnCalorie = 0;
  int timePoint = timePointSec;
  var exCurrent = currentInformation;
  if (exCurrent.time != 0) {
    double oneMinBurn = (exCurrent.burnCalorie / exCurrent.time);
    double oneSecBurn = oneMinBurn / 60;

    double burnTotal = (oneSecBurn * timePoint);
    burnCalorie = double.parse(burnTotal.toStringAsFixed(1));
  }
  return burnCalorie;
}
