import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/base/constant/gender_const.dart';
import 'package:health_application/ui/base/widget/app_bar_widget.dart';
import 'package:health_application/ui/base/widget/back_button.dart';
import 'package:health_application/ui/base/widget/button_gradient.dart';
import 'package:health_application/ui/base/widget/text_field_widget.dart';
import 'package:health_application/ui/elderly/search_volunteer/filter/component/select_gender.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

import '../bloc/search_volunteer_bloc.dart';

void onFiter(BuildContext context) {
  bool filterVolunteer = true;
  showModalBottomSheet(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      backgroundColor: ColorTheme().white,
      isScrollControlled: true,
      context: context,
      builder: (ctx) => BlocBuilder<SearchVolunteerBloc, SearchVolunteerState>(
              builder: (context, state) {
            var search = state.searchVolunteer;
            return Container(
              padding: EdgeInsets.only(
                  top: MediaQueryData.fromWindow(WidgetsBinding.instance.window)
                      .padding
                      .top),
              child: Scaffold(
                backgroundColor: color.whiteBackground,
                appBar: AppBar(
                  elevation: 0,
                  shadowColor: ColorTheme().white,
                  backgroundColor: ColorTheme().white,
                  centerTitle: true,
                  title: textSubtitle18W800('ตัวกรอง', ColorTheme().black87),
                  leading: BackButtonWidget(
                    onClick: () {
                      Navigator.of(context).pop(true);
                    },
                    imgPath: 'assets/images/exit_icon.png',
                  ),
                  actions: [
                    InkWell(
                      onTap: () {
                        context
                            .read<SearchVolunteerBloc>()
                            .add(OnFilter(type: FilterType.reset));
                      },
                      child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(right: 10),
                          child: textSubtitle16Blod(
                              'ล้างค่า', ColorTheme().BlueDark)),
                    )
                  ],
                ),
                body: Padding(
                  padding: EdgeInsets.fromLTRB(15, 20, 15, 0),
                  child: SingleChildScrollView(
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          Container(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    textSubtitle1('เพศ', color.black87),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    selectGender(context,
                                        active:
                                            search.gender == Gender.femaleCode,
                                        imgActive:
                                            'assets/images/woman_volunteer_white.png',
                                        imgInactive:
                                            'assets/images/woman_volunteer_black.png',
                                        title: 'ผู้หญิง', onClick: () {
                                      context.read<SearchVolunteerBloc>().add(
                                          OnFilter(
                                              type: FilterType.gender,
                                              value: search.gender ==
                                                      Gender.femaleCode
                                                  ? ''
                                                  : Gender.femaleCode));
                                    }),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    selectGender(context,
                                        active:
                                            search.gender == Gender.maleCode,
                                        imgActive:
                                            'assets/images/man_volunteer_white.png',
                                        imgInactive:
                                            'assets/images/man_volunteer_black.png',
                                        title: 'ผู้ชาย', onClick: () {
                                      context.read<SearchVolunteerBloc>().add(
                                          OnFilter(
                                              type: FilterType.gender,
                                              value: search.gender ==
                                                      Gender.maleCode
                                                  ? ''
                                                  : Gender.maleCode));
                                    }),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Divider(
                                  color: color.grey50,
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          //TODO
                          /*   //ระยะทาง
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                textSubtitle1('ระยะทาง', color.black87),
                                textH7(
                                  'กำหนดระยะทางไม่เกินช่วงที่ต้องการเอง',
                                  color.grey50,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Slider(
                                  value: 0,
                                  max: 10,
                                  divisions: 1,
                                  thumbColor: color.DartBlue,
                                  activeColor: color.DartBlue,
                                  inactiveColor: color.greyText,
                                  label: 0.round().toString(),
                                  onChanged: (double value) {

                                  },
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    textH7(
                                      '1 กม.',
                                      color.grey50,
                                    ),
                                    textH7(
                                      '10 กม.',
                                      color.grey50,
                                    ),
                                  ],
                                ),
                                Divider(
                                  color: color.grey50,
                                )
                              ],
                            ),
                          ), */

                          //ประสบการฯ์การทำงาน
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                textSubtitle1(
                                    'ประสบการณ์การทำงาน', color.black87),
                                textH7(
                                  'กำหนดประสบการณ์การทำงานเริ่มต้น',
                                  color.grey50,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Slider(
                                  value: search.maxExperience.toDouble(),
                                  max: 4,
                                  divisions: 4,
                                  min: 0,
                                  thumbColor: color.DartBlue,
                                  activeColor: color.DartBlue,
                                  inactiveColor: color.greyText,
                                  label: search.maxExperience.round() < 1
                                      ? '<1 ปี'
                                      : search.maxExperience.round() > 3
                                          ? '>3 ปี'
                                          : '${search.maxExperience.round().toString()} ปี',
                                  onChanged: (double value) {
                                    context.read<SearchVolunteerBloc>().add(
                                        OnFilter(
                                            type: FilterType.experient,
                                            value: value.round()));
                                  },
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    textH7(
                                      '< 1 ปี',
                                      color.grey50,
                                    ),
                                    textH7(
                                      '1 ปี',
                                      color.grey50,
                                    ),
                                    textH7(
                                      '2 ปี',
                                      color.grey50,
                                    ),
                                    textH7(
                                      '3 ปี',
                                      color.grey50,
                                    ),
                                    textH7(
                                      '>3 ปี',
                                      color.grey50,
                                    ),
                                  ],
                                ),
                                Divider(
                                  color: color.grey50,
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                textSubtitle1('ช่วงอายุ', color.black87),
                                textH7(
                                  'ระบุช่วงอายุที่ต้องการ',
                                  color.grey50,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Flexible(
                                        child: TextFieldWidget.enable(
                                      suffix: true,
                                      suffixTxt: 'ปี',
                                      text: search.minAge != 0
                                          ? search.minAge.toString()
                                          : '',
                                      textNumberType: true,
                                      maxLength: 100,
                                      onFieldSubmitted: () {},
                                      onChanged: (value) {
                                        int age = int.tryParse(value) ?? 0;
                                        context.read<SearchVolunteerBloc>().add(
                                            OnFilter(
                                                type: FilterType.minAge,
                                                value: age));
                                      },
                                    )),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 20, right: 20),
                                      child: textSubtitle16Blod(
                                          '-', color.black87),
                                    ),
                                    Flexible(
                                        child: TextFieldWidget.enable(
                                      suffix: true,
                                      suffixTxt: 'ปี',
                                      text: search.maxAge != 0
                                          ? search.maxAge.toString()
                                          : '',
                                      textNumberType: true,
                                      maxLength: 100,
                                      onChanged: (value) {
                                        int age = int.tryParse(value) ?? 0;
                                        context.read<SearchVolunteerBloc>().add(
                                            OnFilter(
                                                type: FilterType.maxAge,
                                                value: age));
                                      },
                                      onFieldSubmitted: () {},
                                    )),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Divider(
                                  color: color.grey50,
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      textSubtitle1('คะแนน', color.black87),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          for (int i = 4; i >= 0; i--)
                                            Flexible(
                                                child: InkWell(
                                              onTap: () {
                                                FilterType type =
                                                    FilterType.addRate;
                                                if (search.ratings
                                                    .contains(i + 1)) {
                                                  type = FilterType.delRate;
                                                }

                                                context
                                                    .read<SearchVolunteerBloc>()
                                                    .add(OnFilter(
                                                        type: type,
                                                        value: i + 1));
                                              },
                                              child: Container(
                                                padding: EdgeInsets.only(
                                                    top: 5, bottom: 5),
                                                margin:
                                                    EdgeInsets.only(right: 10),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: search.ratings
                                                              .contains(i + 1)
                                                          ? color.DartBlue
                                                          : color.GreyBorder),
                                                  color: search.ratings
                                                          .contains(i + 1)
                                                      ? color.DartBlue
                                                      : color.grey10,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(20)),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    textH7(
                                                      (i + 1).toString(),
                                                      search.ratings
                                                              .contains(i + 1)
                                                          ? color.white
                                                          : color.black87,
                                                    ),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    Image.asset(
                                                      search.ratings
                                                              .contains(i + 1)
                                                          ? 'assets/images/star_white.png'
                                                          : 'assets/images/star_outline.png',
                                                      scale: 3,
                                                      color: search.ratings
                                                              .contains(i + 1)
                                                          ? color.white
                                                          : null,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ))
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),

                          ButtonGradient(
                            btnName: 'ค้นหา',
                            onClick: () {
                              Navigator.of(context).pop(true);
                              context
                                  .read<SearchVolunteerBloc>()
                                  .add(SearchVolunteer(search: search));
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }));
}
