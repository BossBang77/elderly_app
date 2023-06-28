import 'package:health_application/ui/base/model/dropdown_model.dart';

const List<DropdownModel> selectNutrients = [
  DropdownModel(code: 'P', desc: 'โปรตีน (g)'),
  DropdownModel(code: 'C', desc: 'คาร์บ (g)'),
  DropdownModel(code: 'F', desc: 'ไขมัน (g)'),
];

String getNutrientDesc(String code) {
  var nutrient = selectNutrients.firstWhere((el) => el.code == code);
  return nutrient.desc;
}
