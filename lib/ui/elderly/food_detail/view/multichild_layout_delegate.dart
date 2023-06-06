import 'package:flutter/material.dart';
import 'package:health_application/ui/elderly/food_detail/view/grid_view_layout.dart';

class GridMultiChildLayoutDelegate extends MultiChildLayoutDelegate {
  GridMultiChildLayoutDelegate({
    required this.layout
  });

  GridViewLayout layout;
  
  @override
  void performLayout(Size size) {

    int row = 0;
    double previousRowHeight = 0;
    for (int index = 0; index < layout.dataSource.length; index++) {
      final itemIndexInRow = index % layout.numberOfItemsPerRow;
      
      final xPosition = itemIndexInRow * (layout.gridItemWidth + layout.spacing);
      var yPosition = (row * previousRowHeight);
      if (row != 0) { yPosition += 10; }
      final Offset position = Offset(xPosition, yPosition);
      final Size size = Size(layout.gridItemWidth, layout.heightForItemAt(index));
      positionChild(index, position);
      layoutChild(index, BoxConstraints.tight(size));
      if ((index % layout.numberOfItemsPerRow) == layout.numberOfItemsPerRow - 1) {
        previousRowHeight = layout.heightForRowAt(row);
        print('${previousRowHeight} ${yPosition}');
        row++;
      }
    }
  }
  
  @override
  bool shouldRelayout(covariant MultiChildLayoutDelegate oldDelegate) {
    return false;
  }
}