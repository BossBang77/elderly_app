import 'package:flutter/material.dart';
import 'package:health_application/ui/extension/date_extension.dart';
import 'package:health_application/ui/extension/reg_exp_pattern.dart';
import 'package:intl/intl.dart';

///string extension
extension StringExtension on String {
  ///return null if string empty
  String? takeOrNullIfEmpty() {
    return isNotEmpty ? this : null;
  }

  String checkEmptyWord() {
    return isNotEmpty ? this : '-';
  }

  ///parse [String] to [DateTime]
  DateTime toDateTime() {
    try {
      return DateFormat('dd/MM/yyyy').parse(this);
    } catch (e) {
      return DateTime.now();
    }
  }

//// display yyyymmdd
  String toDateFullFormat() {
    try {
      if (length == 4) {
        ///// case only yyyy
        return padRight(6, '01');
      } else if (length == 6) {
        ///// case only yyyymm
        return padRight(7, '01');
      } else {
        ///// case yyyymmdd or other
        return this;
      }
    } catch (e) {
      return this;
    }
  }

  ///display citizen
  String toCitizenIDFormat() {
    replaceAll('-', '');
    try {
      return '${substring(0, 1)}'
          '-'
          '${substring(1, 5)}'
          '-'
          '${substring(5, 10)}'
          '-'
          '${substring(10, 12)}'
          '-'
          '${substring(12, 13)}';
    } catch (e) {
      return this;
    }
  }

  ///display mobile phone
  String toPhoneFormat() {
    replaceAll('-', '');
    if (length < 4) {
      return this;
    } else if (length <= 6) {
      return '${substring(0, 3)}'
          '-'
          '${substring(3)}';
    } else if (length < 10) {
      return '${substring(0, 3)}'
          '-'
          '${substring(3, 6)}'
          '-'
          '${substring(6)}';
    } else {
      return '${substring(0, 3)}'
          '-'
          '${substring(3, 6)}'
          '-'
          '${substring(6)}';
    }
  }

  ///display citizen
  String toAccountFormat() {
    replaceAll('-', '');
    try {
      return '${substring(0, 3)}'
          '-'
          '${substring(3, 4)}'
          '-'
          '${substring(4, 9)}'
          '-'
          '${substring(9, 10)}';
    } catch (e) {
      return this;
    }
  }

  ///email valid
  bool emailValid() {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(this);
  }

  ///isEmptyOrSpaceTakeNull
  String? isEmptyOrSpaceTakeNull() {
    try {
      if (isEmpty || this == ' ')
        return null;
      else
        return this;
    } catch (e) {
      return this;
    }
  }

  String formatCasaAccount() {
    var casaAccount10Digit = substring(length - 10);
    //xxx-x-xxxxx-x
    return casaAccount10Digit.substring(0, 3) +
        "-" +
        casaAccount10Digit.substring(3, 4) +
        "-" +
        casaAccount10Digit.substring(4, 9) +
        "-" +
        casaAccount10Digit.substring(9);
  }

  ///no data
  String isNoData() {
    try {
      if (this.trim().toString() == "") {
        return "-";
      } else {
        return this;
      }
    } catch (e) {
      return "-";
    }
  }

  /// RMID format xxxxxxxxxxxxxx   x = 14 digit
  String padLeftRM() {
    return padLeft(14, '0');
  }

  // breakWord in case wrap text
  String get breakWord {
    try {
      String breakWord = '';
      runes.forEach((element) {
        breakWord += String.fromCharCode(element);
        breakWord += '\u200B';
      });
      return breakWord;
    } catch (e) {
      return this;
    }
  }

  String parseToBuddishDateTime() {
    try {
      return DateTime.parse(this).toDisplayBuddishDateTime().isNoData();
    } catch (e) {
      return this;
    }
  }

  String parseToBuddishDate() {
    try {
      return DateTime.parse(this).toDisplayBuddhistDate().isNoData();
    } catch (e) {
      return this;
    }
  }

  double? parseStringToDouble() {
    try {
      return double.tryParse(this)?.toDouble();
    } catch (e) {
      return 0;
    }
  }

  String formatDate(String date) {
    try {
      DateTime dateTime = DateTime.parse(date);
      return DateFormat('yMMMD').format(dateTime);
    } on FormatException {
      return '';
    } catch (e) {
      return '';
    }
  }

  String prefillNumberAutoFormat(String currentPrefill) {
    String newPrefill = this;
    if (length > currentPrefill.length) {
      /// case input new string
      if (length >= 8) {
        //length 8 auto symbol "-"
        if (length == 8) {
          // if length == 8 auto input free text  "-"
          // ex. 01022022 To --> 01022022-
          newPrefill = this + "-";
        }

        /// set format of string
        ///                        (0,8)  "-"  (9)to last length
        /// ex 010220220001 To --> 01022022-0001
        newPrefill = newPrefill.substring(0, 8) + "-" + newPrefill.substring(9);
      }
    } else {
      /// case delete string
      /// ex. 01022022-
      if (newPrefill.length == 8) {
        // check length == 8 delete "-" and text before "-"
        // ex. 01022022-   To  --> 0102202
        newPrefill = newPrefill.substring(0, 7);
      }
    }
    return newPrefill;
  }

  DateTime parseTime() {
    try {
      return DateTime.parse(this);
    } catch (e) {
      return DateTime.now();
    }
  }

  String formatSCAccount() {
    var scAccount13Digit = substring(length - 13);
    //x-xx-x-xxx-xxxxx-x
    return scAccount13Digit.substring(0, 1) +
        "-" +
        scAccount13Digit.substring(1, 3) +
        "-" +
        scAccount13Digit.substring(3, 4) +
        "-" +
        scAccount13Digit.substring(4, 7) +
        "-" +
        scAccount13Digit.substring(7, 12) +
        "-" +
        scAccount13Digit.substring(12, 13);
  }

  String removeCommarDigit() {
    try {
      return replaceAll(',', '');
    } catch (e) {
      return this;
    }
  }

  String toTwoDigitFormat() {
    try {
      return numberTwoDigitFormat.format(double.parse(this));
    } catch (e) {
      return this;
    }
  }

  String toFourDigitFormat() {
    try {
      return numberFourDigitFormat.format(double.parse(this));
    } catch (e) {
      return this;
    }
  }

  TimeOfDay toTimeOfDay() {
    try {
      return TimeOfDay(
          hour: int.parse(split(":")[0]), minute: int.parse(split(":")[1]));
    } catch (e) {
      return TimeOfDay.now();
    }
  }

  bool constainTwoWord(String second) {
    return toLowerCase()
        .removeSpace()
        .contains(second.toLowerCase().removeSpace());
  }

  String removeSpace() {
    return replaceAll(' ', '');
  }

  String lastChars(int n) => substring(length - n);
}
