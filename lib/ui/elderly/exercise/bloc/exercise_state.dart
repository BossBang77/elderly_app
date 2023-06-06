part of 'exercise_bloc.dart';

class ExerciseState extends Equatable {
  const ExerciseState(
      {this.exerciseView = ExerciseView.summary,
      this.timeExercise = '',
      this.searchExSubmit = const SearchExerciseModel(),
      this.searchEx = const SearchExerciseModel(),
      this.searchRes = const SearchResListModel(),
      this.currentInformation = const SearchInformationModel(),
      this.statusSubmit = StatusSubmit.initial});
  final ExerciseView exerciseView;
  final String timeExercise;
  final SearchExerciseModel searchEx;
  final SearchExerciseModel searchExSubmit;
  final SearchResListModel searchRes;
  final SearchInformationModel currentInformation;
  final StatusSubmit statusSubmit;

  ExerciseState.initial(
      {this.exerciseView = ExerciseView.summary,
      this.timeExercise = '',
      this.searchExSubmit = const SearchExerciseModel(),
      this.searchEx = const SearchExerciseModel(),
      this.searchRes = const SearchResListModel(),
      this.currentInformation = const SearchInformationModel(),
      this.statusSubmit = StatusSubmit.initial});

  ExerciseState copyWith(
      {ExerciseView? exerciseView,
      String? timeExercise,
      SearchExerciseModel? searchEx,
      SearchResListModel? searchRes,
      SearchExerciseModel? searchExSubmit,
      SearchInformationModel? currentInformation,
      StatusSubmit? statusSubmit}) {
    return ExerciseState(
        searchExSubmit: searchExSubmit ?? this.searchExSubmit,
        exerciseView: exerciseView ?? this.exerciseView,
        timeExercise: timeExercise ?? this.timeExercise,
        searchEx: searchEx ?? this.searchEx,
        searchRes: searchRes ?? this.searchRes,
        currentInformation: currentInformation ?? this.currentInformation,
        statusSubmit: statusSubmit ?? this.statusSubmit);
  }

  @override
  List<Object> get props => [
        exerciseView,
        timeExercise,
        searchEx,
        searchRes,
        searchExSubmit,
        currentInformation,
        statusSubmit
      ];
}

class ExerciseInitial extends ExerciseState {}

enum FilterType {
  keyWord,
  discrease,
  minKcal,
  maxKcal,
  addTypeExcercise,
  delTypeExcercise,
  resetFilter
}

enum ExerciseView {
  summary,
  search,
  filterEvent,
  exerciseDetail,
  calculate,
  vdoExercise
}

enum StatusSubmit {
  initial,
  loading,
  searchExSuccess,
  searchExFail,
  getInformationSuccess,
  getInformationFail
}

var typeOfExerciseList = [
  'แบบเกร็งกล้ามเนื้ออยู่กับที่ไม่มีการเคลื่อนไหว',
  'แบบทําให้กล้ามเนื้อทํางานเป็นไปอย่างสม่ำเสมอตลอดการเคลื่อนไหว ',
  'แบบใช้ออกซิเจน ',
  'แบบไม่ต้องใช้ออกซิเจน ในระหว่างที่มีการเคลื่อนไหว',
  'แบบมีการยืด-หดตัวของกล้ามเนื้อ '
];
