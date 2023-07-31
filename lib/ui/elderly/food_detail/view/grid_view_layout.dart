import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_application/ui/elderly/food/model/food/ingredient.dart';
import 'package:health_application/ui/elderly/food_search/model/response/food_detail_ingredient.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

class GridViewLayout {
  GridViewLayout(
      {required this.context,
      required this.dataSource,
      this.padding = 0,
      this.spacing = 0,
      this.numberOfItemsPerRow = 0}) {
    gridViewWidth = MediaQuery.of(context).size.width - padding;
    gridItemWidth = (gridViewWidth / numberOfItemsPerRow) -
        ((numberOfItemsPerRow - 1) * spacing);
    numberOfRow =
        (((dataSource.length - 1) / numberOfItemsPerRow).floor() + 1).toInt();
    _textHeightList = _textHeight();
  }

  BuildContext context;
  List<FoodDetailIngredient> dataSource;
  int numberOfRow = 0;
  int numberOfItemsPerRow = 0;
  double gridItemWidth = 0;
  double gridItemPadding = 10;
  double padding = 0;
  double spacing = 0;
  double verticalSpacing = 20;
  double lineHeight = 15;

  double gridViewWidth = 0;

  TextStyle style = TextStyle(
      fontSize: 15.sp, fontFamily: fontFamily, fontWeight: FontWeight.w500);

  List<double> _textHeightList = [];

  List<double> _textHeight() {
    return List<int>.generate(numberOfRow, (i) => i).map((rowNumber) {
      final int itemInRow = rowNumber == numberOfRow - 1
          ? numberOfItemsPerRow -
              (((rowNumber + 1) * numberOfItemsPerRow) - dataSource.length)
          : numberOfItemsPerRow;
      List<double> itemsInRowHeight =
          List<int>.generate(itemInRow, (i) => i + rowNumber).map((index) {
        final titleTextViewHeight =
            _textViewHeightFromText(dataSource[index].name);
        final valueTextViewHeight = _textViewHeightFromText(
            dataSource[index].unit.toString() +
                ' ' +
                dataSource[index].unitName);

        final textViewHeight = titleTextViewHeight + valueTextViewHeight;
        return textViewHeight;
      }).toList();
      return itemsInRowHeight
          .reduce((value, element) => value > element ? value : element);
    }).toList();
  }

  double _textViewHeightFromText(String text) {
    final span = TextSpan(text: text, style: style);
    final textPainter =
        TextPainter(text: span, textDirection: TextDirection.ltr);
    textPainter.layout(maxWidth: gridItemWidth - gridItemPadding);
    return textPainter.size.height;
  }

  double heightForItemAt(int index) {
    final rowIndex = ((index / numberOfItemsPerRow)).floor();
    return _textHeightList[rowIndex] + gridItemWidth + verticalSpacing;
  }

  double heightForRowAt(int index) {
    return _textHeightList[index] + gridItemWidth + verticalSpacing;
  }

  int rowForIndex(int index) {
    return ((index / (numberOfRow * numberOfItemsPerRow))).floor();
  }

  double get gridViewHeight =>
      List<int>.generate(numberOfRow, (i) => i)
          .map((index) => heightForRowAt(index))
          .reduce((value, element) => value + element) +
      16;
}
