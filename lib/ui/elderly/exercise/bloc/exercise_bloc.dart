import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:health_application/repository/exercise_repos.dart';
import 'package:health_application/ui/base/model/failure.dart';
import 'package:health_application/ui/elderly/exercise/model/search_exercise_model.dart';
import 'package:health_application/ui/elderly/exercise/model/search_information.dart';
import 'package:health_application/ui/elderly/exercise/model/search_res_list.dart';
import 'package:health_application/ui/elderly/exercise/model/search_res_model.dart';

part 'exercise_event.dart';
part 'exercise_state.dart';

class ExerciseBloc extends Bloc<ExerciseEvent, ExerciseState> {
  ExerciseBloc() : super(ExerciseState.initial()) {}
  ExerciseRepository _exerciseRepository = ExerciseRepository();

  @override
  Stream<ExerciseState> mapEventToState(ExerciseEvent event) async* {
    if (event is Initial) {
      yield ExerciseState.initial();
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
            statusSubmit: StatusSubmit.getInformationFail);
      }, (SearchInformationModel res) async* {
        yield state.copyWith(
            currentInformation: res,
            statusSubmit: StatusSubmit.getInformationSuccess);
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
