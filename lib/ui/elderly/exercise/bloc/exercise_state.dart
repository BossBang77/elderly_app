part of 'exercise_bloc.dart';

class ExerciseState extends Equatable {
  const ExerciseState(
      {this.exerciseView = ExerciseView.summary,
      this.timeExercise = '',
      this.searchExSubmit = const SearchExerciseModel(),
      this.searchEx = const SearchExerciseModel(),
      this.searchRes = const SearchResListModel(),
      this.currentInformation = const SearchInformationModel(),
      this.statusSubmit = StatusSubmit.initial,
      this.exerciseDaily = const ExerciseDailyModel(),
      this.recordList = const SearchResListModel(),
      this.statusView = StatusViewExercise.caseNew,
      this.role = '',
      this.loading = false,
      this.recentlyList = const <String>[]});
  final ExerciseView exerciseView;
  final String timeExercise;
  final SearchExerciseModel searchEx;
  final SearchExerciseModel searchExSubmit;
  final SearchResListModel searchRes;
  final SearchInformationModel currentInformation;
  final StatusSubmit statusSubmit;
  final ExerciseDailyModel exerciseDaily;
  final SearchResListModel recordList;
  final StatusViewExercise statusView;
  final String role;
  final bool loading;
  final List<String> recentlyList;

  ExerciseState.initial(
      {this.exerciseView = ExerciseView.summary,
      this.timeExercise = '',
      this.searchExSubmit = const SearchExerciseModel(),
      this.searchEx = const SearchExerciseModel(),
      this.searchRes = const SearchResListModel(),
      this.currentInformation = const SearchInformationModel(),
      this.statusSubmit = StatusSubmit.initial,
      this.exerciseDaily = const ExerciseDailyModel(),
      this.recordList = const SearchResListModel(),
      this.statusView = StatusViewExercise.caseNew,
      this.role = '',
      this.loading = false,
      this.recentlyList = const <String>[]});

  ExerciseState copyWith(
      {ExerciseView? exerciseView,
      String? timeExercise,
      SearchExerciseModel? searchEx,
      SearchResListModel? searchRes,
      SearchExerciseModel? searchExSubmit,
      SearchInformationModel? currentInformation,
      StatusSubmit? statusSubmit,
      ExerciseDailyModel? exerciseDaily,
      SearchResListModel? recordList,
      StatusViewExercise? statusView,
      String? role,
      bool? loading,
      List<String>? recentlyList}) {
    return ExerciseState(
        searchExSubmit: searchExSubmit ?? this.searchExSubmit,
        exerciseView: exerciseView ?? this.exerciseView,
        timeExercise: timeExercise ?? this.timeExercise,
        searchEx: searchEx ?? this.searchEx,
        searchRes: searchRes ?? this.searchRes,
        currentInformation: currentInformation ?? this.currentInformation,
        statusSubmit: statusSubmit ?? this.statusSubmit,
        exerciseDaily: exerciseDaily ?? this.exerciseDaily,
        recordList: recordList ?? this.recordList,
        statusView: statusView ?? this.statusView,
        role: role ?? this.role,
        loading: loading ?? this.loading,
        recentlyList: recentlyList ?? this.recentlyList);
  }

  @override
  List<Object> get props => [
        exerciseView,
        timeExercise,
        searchEx,
        searchRes,
        searchExSubmit,
        currentInformation,
        statusSubmit,
        exerciseDaily,
        recordList,
        statusView,
        role,
        loading,
        recentlyList
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
  getInformationFail,
  removeExerciseRecordSuccess,
  removeExerciseRecordFail,
  saveRecordSuccess,
  saveRecordFail,
  saveExerciseDailySuccess,
  saveExerciseDailyFail
}

enum StatusViewExercise { caseResume, caseNew }

var typeOfExerciseList = [
  'แบบเกร็งกล้ามเนื้ออยู่กับที่ไม่มีการเคลื่อนไหว',
  'แบบทําให้กล้ามเนื้อทํางานเป็นไปอย่างสม่ำเสมอตลอดการเคลื่อนไหว ',
  'แบบใช้ออกซิเจน ',
  'แบบไม่ต้องใช้ออกซิเจน ในระหว่างที่มีการเคลื่อนไหว',
  'แบบมีการยืด-หดตัวของกล้ามเนื้อ '
];

enum RoleType { initial, ROLE_USER_ELDERLY, ROLE_USER_VOLUNTEER }
