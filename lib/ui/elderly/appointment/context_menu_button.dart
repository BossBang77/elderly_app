import 'package:flutter/material.dart';
import 'package:health_application/ui/elderly/appointment_detail/appointment_status_section/appointment_status_section.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

class ContextMenuButton<ValueType> extends StatefulWidget {
  const ContextMenuButton(
      {Key? key, this.items = const [], this.initialValue, this.onSelect})
      : super(key: key);

  final List<ContextMenuItem<ValueType>> items;
  final ValueType? initialValue;
  final void Function(ValueType)? onSelect;

  @override
  State<StatefulWidget> createState() => _ContextMenuButtonState<ValueType>();
}

class _ContextMenuButtonState<ValueType>
    extends State<ContextMenuButton<ValueType>> {
  _ContextMenuButtonState({this.initialValue});

  final GlobalKey key = GlobalKey();
  final ValueType? initialValue;
  ValueType? selectedItem;

  @override
  void initState() {
    super.initState();
    selectedItem = initialValue;
  }

  String title() {
    final index =
        widget.items.indexWhere((element) => element.value == selectedItem);
    if (index >= 0) {
      return widget.items[index].title;
    }
    return widget.items.first.title;
  }

  void _showContextMenu(BuildContext context, TapDownDetails details) async {
    RenderBox box = key.currentContext?.findRenderObject() as RenderBox;
    Offset position = box.localToGlobal(Offset.zero); //this is global position
    final RenderObject? overlay =
        Overlay.of(context)?.context.findRenderObject();
    final result = await showMenu(
        context: context,
        position: RelativeRect.fromRect(
            Rect.fromLTWH(position.dx - (box.size.width / 2),
                position.dy + box.size.height, 30, 30),
            Rect.fromLTWH(0, 0, overlay!.paintBounds.size.width,
                overlay.paintBounds.size.height)),
        items: widget.items
            .map((item) => PopupMenuItem(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      textSubtitle2(
                          item.title,
                          title() == item.title
                              ? color.blueText
                              : ColorTheme().black87,
                          false),
                      if (title() == item.title) ...{
                        Icon(
                          Icons.check,
                          color: color.blueText,
                        )
                      }
                    ],
                  ),
                  value: item.value,
                ))
            .toList());

    setState(() {
      if (result is ValueType) {
        selectedItem = result;
        widget.onSelect?.call(result);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTapDown: (details) {
          _showContextMenu(context, details);
        },
        child: Container(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            key: key,
            child: Row(children: [
              textSubtitle2(title(), ColorTheme().black87, true),
              SizedBox(width: 6),
              Image.asset('assets/images/icon_arrow_down.png',
                  width: 10, height: 10)
            ])));
  }
}

class ContextMenuItem<ValueType> {
  const ContextMenuItem({required this.value, required this.title});
  final ValueType value;
  final String title;
}

enum AppointmentTypeFilter {
  all(title: 'ทั้งหมด', status: null),
  start(title: 'เริ่มงาน', status: AppointmentStatus.start),
  waitforstart(title: 'รอเริ่มงาน', status: AppointmentStatus.waitingtostart),
  waitforapprove(title: 'รอการยืนยัน', status: AppointmentStatus.create);

  const AppointmentTypeFilter({required this.title, this.status});
  final String title;
  final AppointmentStatus? status;
}
