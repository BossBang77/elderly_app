import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:health_application/ui/base/widget/space_widget.dart';
import 'package:health_application/ui/base/widget/text_field_widget.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

class SearchMedication extends StatelessWidget {
  const SearchMedication({super.key});

  @override
  Widget build(BuildContext context) {
    //TODO assign value
    bool isSearch = false;
    int selectIndex = 0;
    return StatefulBuilder(
      builder: (context, setState) {
        return Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 3,
              decoration:
                  StyleBorder().blueDecoration(isBorder: false, radius: 15),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            textBody1('ชื่อยา', color.black87),
                            SpaceWidget(
                              height: 10,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  color: color.BackgroundWhite,
                                  boxShadow: [
                                    BoxShadow(
                                      color: color.grey50.withOpacity(0.2),
                                      blurRadius: 2,
                                    ),
                                  ],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        isSearch = !isSearch;
                                      });
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        textBody1('ต.ย.: Metronidazol',
                                            color.greyText),
                                        Image.asset(
                                          !isSearch
                                              ? 'assets/images/arrow_down.png'
                                              : 'assets/images/arrow_up.png',
                                          scale: 4,
                                        )
                                      ],
                                    ),
                                  ),
                                  if (isSearch)
                                    Column(
                                      children: [
                                        SpaceWidget(
                                          height: 10,
                                        ),
                                        Divider(),
                                        SpaceWidget(
                                          height: 10,
                                        ),
                                        TextFieldWidget.enable(
                                          text: '',
                                          maxLength: 100,
                                          hintText: 'ค้นหาชื่อยา',
                                          prefix: true,
                                          imagePathPrefix:
                                              'assets/images/search_icon.png',
                                        ),
                                        SpaceWidget(
                                          height: 10,
                                        ),
                                        Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.5,
                                          child: SingleChildScrollView(
                                            child: Column(
                                              children: [
                                                for (int i = 0; i < 80; i++)
                                                  InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        isSearch = !isSearch;
                                                        selectIndex = i;
                                                      });
                                                    },
                                                    child: Container(
                                                      padding: EdgeInsets.only(
                                                          top: 10,
                                                          bottom: 10,
                                                          left: 10,
                                                          right: 10),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          textSubtitle2(
                                                              'Furosemide 500 mg $i',
                                                              (i == selectIndex)
                                                                  ? color
                                                                      .blueText
                                                                  : color
                                                                      .black87,
                                                              false),
                                                          (i == selectIndex)
                                                              ? Icon(
                                                                  Icons.check,
                                                                  color: color
                                                                      .blueText,
                                                                )
                                                              : Container()
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                ],
                              ),
                            ),
                            SpaceWidget(
                              height: 20,
                            ),
                            if (!isSearch)
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(Icons.info_outline),
                                  SpaceWidget(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      textSubtitle16W500(
                                          'เกี่ยวกับยา', color.black87),
                                      textSubtitle16W500(
                                          'ชื่อสามัญ : ฟูโรซีไมด์',
                                          color.black87),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.7,
                                        child: textSubtitle16W500(
                                          'สรรพคุณ : ขับปัสสาวะ ลดการบวมน้ำ และลดความดันโลหิต',
                                          color.black87,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                          ]),
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
