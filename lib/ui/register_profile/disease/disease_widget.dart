import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_application/ui/base/widget/app_bar_widget.dart';
import 'package:health_application/ui/base/widget/button_gradient.dart';
import 'package:health_application/ui/base/widget/text_field_widget.dart';
import 'package:health_application/ui/register_profile/bloc/register_profile_bloc.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';
import 'package:provider/provider.dart';

class DiseaseWidget extends StatelessWidget {
  const DiseaseWidget({super.key, required this.state});
  final RegisterProfileState state;
  @override
  Widget build(BuildContext context) {
    var sized = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar(
          onBack: () {
            context
                .read<RegisterProfileBloc>()
                .add(ChangeProfileView(profileType: ProfileType.bmiProfile));
          },
          title: 'โรคประจำตัว'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Column(children: [
                const SizedBox(
                  height: 10,
                ),
                TextFieldWidget.enable(
                  text: '',
                  hintText: 'ค้นหาโรคประจำตัว',
                  prefix: true,
                  prefixTxt: null,
                  imagePathPrefix: 'assets/images/search_icon.png',
                  maxLength: 100,
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                    child: ListView.separated(
                  padding: const EdgeInsets.all(8),
                  // TODO Integrte master data
                  itemCount: 0,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {},
                      child: Container(
                        height: 60,
                        child: Row(
                          children: [
                            Image.asset(
                              false
                                  ? 'assets/images/isCheck.png'
                                  : 'assets/images/un_check.png',
                              scale: 3,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            textSubtitle1('โรคหัวใจ', color.black87),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      Container(),
                ))
              ]),
            ),
          ),
          Flexible(
              flex: 2,
              child: Container(
                padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
                height: sized.height * 0.5,
                decoration: BoxDecoration(
                  color: ColorTheme().white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: ColorTheme().grey50,
                      blurRadius: 20.0,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    // TODO Integrte master data
                    if (false) ...{
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          textSubtitle16Blod('เลือก 1 รายการ', color.black87),
                          textSubtitle2('ล้างทั้งหมด', color.Primary, false),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                              width: sized.width,
                              child: Text(
                                  'โรคความดันโลหิตสูง, โรคเบาหวาน,โรคภูมิคุ้มกันบกพร่อง , โรคอ้วน',
                                  softWrap: true,
                                  style: TextStyle(
                                      color: color.black87,
                                      fontSize: 14.sp,
                                      fontFamily: fontFamily,
                                      fontWeight: FontWeight.w500)))
                        ],
                      ),
                    },
                    ButtonGradient(
                      btnName: 'ยืนยัน',
                      onClick: () {
                        context.read<RegisterProfileBloc>().add(
                            ChangeProfileView(
                                profileType: ProfileType.foodAllergies));
                      },
                    ),
                  ],
                ),
              )),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
