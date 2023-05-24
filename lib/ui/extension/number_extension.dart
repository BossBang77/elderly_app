import 'package:intl/intl.dart';

extension NumberExtension on double {
  static NumberFormat numberFormatForPrice = NumberFormat("#,##0.00", "en_US");
  static NumberFormat numberFormatForUnit = NumberFormat("#,##0.0000", "en_US");

  String generateNumberFormatForPrice() {
    try {
      return numberFormatForPrice.format(this).toString();
    } catch (e) {
      return '-';
    }
  }

  String generateNumberFormatForUnit() {
    try {
      return numberFormatForUnit.format(this).toString();
    } catch (e) {
      return '-';
    }
  }
}
