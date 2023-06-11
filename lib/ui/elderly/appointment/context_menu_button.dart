import 'package:flutter/material.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

class ContextMenuButton<ValueType> extends StatefulWidget {
  const ContextMenuButton({
    Key? key,
    this.items = const[],
    this.initialValue
  }) : super(key: key);

  final List<ContextMenuItem<ValueType>> items;
  final ValueType? initialValue;

  @override
  State<StatefulWidget> createState() => _ContextMenuButtonState<ValueType>();
}

class _ContextMenuButtonState<ValueType> extends State<ContextMenuButton> {
  _ContextMenuButtonState({this.initialValue});
  
  final GlobalKey key = GlobalKey();
  final ValueType? initialValue;
  ValueType? selectedItem;

  @override
  void initState() {
    super.initState();
    selectedItem = initialValue;
  }

  void _showContextMenu(BuildContext context, TapDownDetails details) async {
    RenderBox box = key.currentContext?.findRenderObject() as RenderBox;
    Offset position = box.localToGlobal(Offset.zero); //this is global position
    final RenderObject? overlay = Overlay.of(context)?.context.findRenderObject();
    final result = await showMenu(
      context: context, 
      position: RelativeRect.fromRect(
        Rect.fromLTWH(position.dx - (box.size.width / 2), position.dy + box.size.height, 30, 30), 
        Rect.fromLTWH(0, 0, overlay!.paintBounds.size.width, overlay.paintBounds.size.height)
      ),
      items: widget.items.map((item) =>
        PopupMenuItem(
          child: textSubtitle2(item.title, ColorTheme().black87, false),
          value: item.value,
        )
      ).toList()
    );

    setState(() {
      if (result is ValueType) {
        selectedItem = result;
      }
    });
  }

  @override 
  Widget build(BuildContext context) {
    String title() {
      final index = widget.items.indexWhere((element) => element.value == selectedItem);
      if (index >= 0) {
        return widget.items[index].title;
      }
      return widget.items.first.title;
    }


    return GestureDetector(
      onTapDown: (details) {
        _showContextMenu(context, details);
      },
      child: Container(
        padding: EdgeInsets.only(top: 10, bottom: 10),
        key: key,
        child: Row(
          children: [
            textSubtitle2(title(), ColorTheme().black87, true),
            SizedBox(width: 6),
            Image.asset('assets/images/icon_arrow_down.png', width: 10, height: 10)
          ]
        )
      )
    );
  }
}

class ContextMenuItem<ValueType> {
  const ContextMenuItem({
    required this.value,
    required this.title
  });
  final ValueType value;
  final String title;
}