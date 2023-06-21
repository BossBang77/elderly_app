class Gender {
  static String get maleCode => 'MALE';
  static String get femaleCode => 'FEMALE';
  static String get otherCode => 'OTHER';
  static String get maleTitle => 'เพศชาย';
  static String get femaleTitle => 'เพศหญิง';
  static String get otherTitle => 'ไม่ระบุ';

  static String mapToTitle(String code) {
    if (code == maleCode) {
      return maleTitle;
    } else if (code == femaleCode) {
      return femaleTitle;
    } else {
      return otherTitle;
    }
  }

  static bool isWoman(String code) {
    return code == femaleCode;
  }
}
