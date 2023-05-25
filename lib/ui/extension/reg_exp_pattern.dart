import 'package:intl/intl.dart';

// alphanumeric + \-()\/_=$%$+!"
RegExp alphanumericFormat = RegExp(r'[0-9a-zA-Z\-()\/_=$%$*&|@#^,+!"]');
// document format  a-z,A-Z,0-9  ( ) - . :
RegExp documentNoFormat = RegExp(r'[0-9a-zA-Z\-().:]');
// double four digit xxx,xxx.xxxx
NumberFormat numberFourDigitFormat = NumberFormat("#,##0.0000", "en_US");
// double two digit xxx,xxx.xx
NumberFormat numberTwoDigitFormat = NumberFormat("#,##0.00", "en_US");
//format only number and -
RegExp onlyNumber = RegExp(r'[0-9\-]');
RegExp onlyNumberAndSlash = RegExp(r'[0-9/]');
