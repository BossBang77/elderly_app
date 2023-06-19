class Gender {
  static String get maleCode => 'MALE';
  static String get femaleCode => 'FEMALE';
  static String get maleTitle => 'เพศชาย';
  static String get femaleTitle => 'เพศหญิง';

  static String mapToTitle(String code) {
    return code == maleCode ? maleTitle : femaleTitle;
  }

  static bool isWoman(String code) {
    return code == femaleCode;
  }

  static String getPicGenderVolunteer(String code) {
    if (code == maleCode) {
      return 'assets/images/volunteer_help_men.png';
    } else {
      return 'assets/images/volunteer_help_woman.png';
    }
  }
}
