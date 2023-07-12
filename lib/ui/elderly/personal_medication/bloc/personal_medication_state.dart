part of 'personal_medication_bloc.dart';

class PersonalMedicationState extends Equatable {
  const PersonalMedicationState(
      {this.pageView = PageViewMedication.summaryPage,
      this.masterMedication = const <MasterMedicationModel>[],
      this.currentMedication = const MedicationDetailModel(),
      this.personalMedicationList = const ListMedicationDetailModel(),
      this.isLoading = false,
      this.submitState = SubmitState.initial,
      this.modeData = ModeData.CREATE});

  final PageViewMedication pageView;
  final List<MasterMedicationModel> masterMedication;
  final ListMedicationDetailModel personalMedicationList;
  final MedicationDetailModel currentMedication;
  final bool isLoading;
  final SubmitState submitState;
  final ModeData modeData;

  PersonalMedicationState copyWith(
      {PageViewMedication? pageView,
      bool? isLoading,
      List<MasterMedicationModel>? masterMedication,
      ListMedicationDetailModel? personalMedicationList,
      MedicationDetailModel? currentMedication,
      SubmitState? submitState,
      ModeData? modeData}) {
    return PersonalMedicationState(
        pageView: pageView ?? this.pageView,
        masterMedication: masterMedication ?? this.masterMedication,
        personalMedicationList:
            personalMedicationList ?? this.personalMedicationList,
        currentMedication: currentMedication ?? this.currentMedication,
        isLoading: isLoading ?? this.isLoading,
        submitState: submitState ?? this.submitState,
        modeData: modeData ?? this.modeData);
  }

  @override
  List<Object> get props => [
        pageView,
        masterMedication,
        personalMedicationList,
        currentMedication,
        isLoading,
        submitState,
        modeData
      ];
}

class PersonalMedicationInitial extends PersonalMedicationState {}

enum PageViewMedication { summaryPage, medicationDetail }

enum Period {
  BEFORRE_MEAL(title: 'ก่อนอาหาร', img: 'assets/images/before_eat.png'),
  AFTER_MEAL(title: 'หลังอาหาร', img: 'assets/images/after_eat.png'),
  BEFORRE_BED(title: 'ก่อนนอน', img: 'assets/images/sleepy.png');

  const Period({required this.title, required this.img});
  final String title;
  final String img;
}

enum TimeOfMedication {
  MORNING(title: 'เช้า', timeCode: 'MEDICATION_MORNING'),
  DAYTIME(title: 'กลางวัน', timeCode: 'MEDICATION_LUNCH'),
  EVENING(title: 'เย็น', timeCode: 'MEDICATION_EVENING'),
  OTHER(title: 'อื่นๆ', timeCode: '');

  const TimeOfMedication({required this.title, required this.timeCode});
  final String title;
  final String timeCode;
}

String get keyCodeTimeBeforeBed => 'MEDICATION_BEFORE_BEDTIME';

enum SubmitState {
  initial(title: ''),
  deleteMedicationFail(title: 'ลบรายการยาไม่สำเร็จ'),
  deleteMedicationSuccess(title: 'ลบรายการยาสำเร็จ'),
  submitMedicationFail(title: 'บันทึกข้อมูลไม่สำเร็จ'),
  submitMedicationSuccess(title: 'บันทึกข้อมูลสำเร็จ');

  const SubmitState({required this.title});
  final String title;
}

enum MedicationType {
  PILL(img: 'assets/images/pill.png'),
  INJECTION(img: 'assets/images/injection.png'),
  LIQUID(img: 'assets/images/liquid.png'),
  SALVE(img: 'assets/images/salve.png');

  const MedicationType({required this.img});
  final String img;
}

enum ModeData { CREATE, UPDATE }

enum MedicationChange {
  drugName,
  dosage,
  peroid,
  addTime,
  removeTime,
  setTimeNoti,
  setDescription,
  setRepeatNoti,
  setTimeBeforeBed
}
