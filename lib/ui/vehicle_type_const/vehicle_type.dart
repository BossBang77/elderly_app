class VehicleTypeConst {
  static String get bicycle => "VT001"; //รถจักรยาน
  static String get motorcycle => "VT002"; //รถจักรยานยนต์
  static String get tricycle => "VT003"; //รถสามล้อเครื่อง
  static String get sedan => "VT004"; //รถเก๋ง
  static String get pickup => "VT005"; //รถกะบะ
  static String get bus => "VT006"; //รถประจำทาง
  static String get truck => "VT007"; //รถบรรทุก
  static String get towTruck => "VT008"; //รถพ่วง
  static String get train => "VT009"; //รถพ่วง

  static bool isGroupRide(String code) {
    return code == bicycle || code == motorcycle || code == tricycle;
  }

  static bool isGroupDrive(String code) {
    return code == sedan ||
        code == pickup ||
        code == bus ||
        code == truck ||
        code == towTruck;
  }

  static bool isGroupTrain(String code) {
    return code == train;
  }
}
