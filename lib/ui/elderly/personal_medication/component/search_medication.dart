import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_application/ui/base/widget/space_widget.dart';
import 'package:health_application/ui/base/widget/text_field_widget.dart';
import 'package:health_application/ui/base/widget/title_header.dart';
import 'package:health_application/ui/elderly/personal_medication/bloc/personal_medication_bloc.dart';
import 'package:health_application/ui/elderly/personal_medication/model/master_medication.dart';
import 'package:health_application/ui/extension/string_extension.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

class SearchMedication extends StatelessWidget {
  const SearchMedication({super.key});

  @override
  Widget build(BuildContext context) {
    //TODO assign value
    bool isSearch = false;
    String textSearch = '';
    return BlocBuilder<PersonalMedicationBloc, PersonalMedicationState>(
      builder: (context, state) {
        var currentMedication = state.currentMedication;

        return StatefulBuilder(
          builder: (context, setState) {
            List<MasterMedicationModel> getListDDL(textSearch) {
              List<MasterMedicationModel> list = [];
              state.masterMedication.forEach((item) {
                if (item.name.contains(textSearch)) {
                  list.add(item);
                }
              });
              return list;
            }

            var medicationSelect = getMedication(
                state.masterMedication, currentMedication.medicationId);
            return Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 3,
                  decoration:
                      StyleBorder().blueDecoration(isBorder: false, radius: 15),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TitleHeaderWidget(
                                  title: 'ชื่อยา',
                                  isMandatory: true,
                                ),
                                SpaceWidget(
                                  height: 10,
                                ),
                                Container(
                                  width: 295.w,
                                  padding: EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                      color: color.BackgroundWhite,
                                      boxShadow: [
                                        BoxShadow(
                                          color: color.grey50.withOpacity(0.2),
                                          blurRadius: 2,
                                        ),
                                      ],
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: Column(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            isSearch = !isSearch;
                                            textSearch = '';
                                          });
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            textBody1(
                                                currentMedication
                                                        .medicationId.isEmpty
                                                    ? 'ต.ย.: Metronidazol'
                                                    : getNameMedication(
                                                        state.masterMedication,
                                                        currentMedication
                                                            .medicationId),
                                                currentMedication
                                                        .medicationId.isEmpty
                                                    ? color.greyText
                                                    : color.black87),
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
                                              text: textSearch,
                                              maxLength: 100,
                                              hintText: 'ค้นหาชื่อยา',
                                              prefix: true,
                                              imagePathPrefix:
                                                  'assets/images/search_icon.png',
                                              onChanged: (value) {
                                                setState(
                                                  () {
                                                    textSearch = value;
                                                  },
                                                );
                                              },
                                            ),
                                            SpaceWidget(
                                              height: 10,
                                            ),
                                            Container(
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  children: [
                                                    if (getListDDL(textSearch)
                                                        .isEmpty)
                                                      textSubtitle15w400(
                                                        'ไม่พบรายการยา',
                                                        color.grey50,
                                                      ),
                                                    for (var item in getListDDL(
                                                        textSearch))
                                                      InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            isSearch =
                                                                !isSearch;
                                                            textSearch = '';
                                                          });
                                                          addEvent(
                                                              context,
                                                              ChangeDetailMedication(
                                                                  type: MedicationChange
                                                                      .drugName,
                                                                  value:
                                                                      item.id));
                                                        },
                                                        child: Container(
                                                          padding:
                                                              EdgeInsets.only(
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
                                                                  item.name,
                                                                  (item.id ==
                                                                          currentMedication
                                                                              .medicationId)
                                                                      ? color
                                                                          .blueText
                                                                      : color
                                                                          .black87,
                                                                  false),
                                                              (item.id ==
                                                                      currentMedication
                                                                          .medicationId)
                                                                  ? Icon(
                                                                      Icons
                                                                          .check,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                              'ชื่อสามัญ : ${medicationSelect.commonName.isNoData()}',
                                              color.black87),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.7,
                                            child: textSubtitle16W500(
                                              'สรรพคุณ : ${medicationSelect.description.isNoData()}',
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
      },
    );
  }
}
