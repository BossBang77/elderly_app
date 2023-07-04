import 'package:health_application/ui/base/model/dropdown_model.dart';

List<DropdownModel> selectNutrients = [
  DropdownModel(code: NutrientsEnum.Protein.name, desc: 'โปรตีน (g)'),
  DropdownModel(code: NutrientsEnum.Carb.name, desc: 'คาร์บ (g)'),
  DropdownModel(code: NutrientsEnum.Fat.name, desc: 'ไขมัน (g)'),
  DropdownModel(code: NutrientsEnum.Sugar.name, desc: 'น้ำตาล (g)'),
];

String getNutrientDesc(String code) {
  var nutrient = selectNutrients.firstWhere((el) => el.code == code);
  return nutrient.desc;
}

enum GraphRangeType {
  oneWeek,
  oneMonth,
}

enum HistoryFoodTab {
  summary,
  history,
}

enum LunchIcon {
  breakfast,
  lunch,
  snack,
  dinner,
}

enum NutrientsEnum {
  Protein,
  Carb,
  Fat,
  Sugar,
}

// extension Nutrients on NutrientsEnum {
//   String get name {
//     switch (this) {
//       case NutrientsEnum.Protein:
//         return 'Protein';
//       case NutrientsEnum.Carb:
//         return 'Carb';
//       case NutrientsEnum.Fat:
//         return 'Fat';
//       case NutrientsEnum.Sugar:
//         return 'Sugar';
//       default:
//         return '';
//     }
//   }
// }
