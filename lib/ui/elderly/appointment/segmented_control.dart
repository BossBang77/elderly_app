import 'package:flutter/material.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

class SegmentedControl<ValueType> extends StatefulWidget {
  const SegmentedControl({
    this.items = const[],
    this.initialValue,
    this.onSelect
  });

  final ValueType? initialValue;
  final List<SegmentedControlItem<ValueType>> items;
  final Function(ValueType)? onSelect;

  @override
  State<StatefulWidget> createState() => _SegmentedControlState<ValueType>(initialValue: initialValue);
}

class _SegmentedControlState<ValueType> extends State<SegmentedControl> {
  _SegmentedControlState({this.initialValue});
  final ValueType? initialValue;
  ValueType? _selectedItem;

  @override
  void initState() {
    super.initState();
    _selectedItem = initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: ColorTheme().lightBlue,
        borderRadius: BorderRadius.circular(54)
      ),
      child: Row(
        children: widget.items.map((item) => 
          Expanded(
            child: GestureDetector(
              onTap: () {
                widget.onSelect?.call(item.value);
                setState(() {
                  _selectedItem = item.value;
                });
              },
              child: Container(
                height: 48,
                decoration: BoxDecoration(
                  color: _selectedItem == item.value ? ColorTheme().Primary : Colors.transparent,
                  borderRadius: BorderRadius.circular(54)
                ),
                child: Center(
                  child: textSubtitle2(
                    item.title, 
                    _selectedItem == item.value ? ColorTheme().white : ColorTheme().black87, 
                    true
                  )
                ),
              )
            )
          ),
        ).toList()
      )
    );
  }
}

class SegmentedControlItem<ValueType> {
  const SegmentedControlItem({required this.title, required this.value});
  final String title;
  final ValueType value;
}