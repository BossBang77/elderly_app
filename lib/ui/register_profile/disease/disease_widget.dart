import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_application/ui/base/bloc/master_data_bloc.dart';
import 'package:health_application/ui/base/model/master_data.dart';
import 'package:health_application/ui/base/model/master_data_detail.dart';
import 'package:health_application/ui/base/widget/app_bar_widget.dart';
import 'package:health_application/ui/base/widget/button_gradient.dart';
import 'package:health_application/ui/base/widget/text_field_widget.dart';
import 'package:health_application/ui/register_profile/bloc/register_profile_bloc.dart';
import 'package:health_application/ui/register_profile/model/sub_menu_model.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';
import 'package:provider/provider.dart';

class DiseaseWidget extends StatelessWidget {
  const DiseaseWidget({super.key, required this.state});
  final RegisterProfileState state;
  @override
  Widget build(BuildContext context) {
    var sized = MediaQuery.of(context).size;
    MasterData congenitalDisease =
        BlocProvider.of<MasterDataBloc>(context).state.congenitalDiseaseMaster;
    var list = [...state.registerModel.congenitalDisease];

    String filterText = state.textFilterDisease;

    List<MasterDataDetail> filterMasterDisease() {
      List<MasterDataDetail> diseaseList = [];
      congenitalDisease.data.forEach((master) {
        if (master.keyName.contains(filterText)) {
          diseaseList.add(master);
        }
      });

      return diseaseList;
    }

    String getAllCongrnital() {
      String allName = '';
      list.forEach((element) {
        allName = allName + '${allName.isNotEmpty ? ',' : ''}' + element.name;
      });
      return allName;
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                  text: state.textFilterDisease,
                  hintText: 'ค้นหาโรคประจำตัว',
                  prefix: true,
                  prefixTxt: null,
                  imagePathPrefix: 'assets/images/search_icon.png',
                  maxLength: 100,
                  onChanged: (value) {
                    context.read<RegisterProfileBloc>().add(FormFillType(
                        type: FillType.searchDisease, value: value));
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                    child: ListView.separated(
                  padding: const EdgeInsets.all(8),
                  itemCount: filterMasterDisease().length,
                  itemBuilder: (BuildContext context, int index) {
                    MasterDataDetail item = filterMasterDisease()[index];

                    String isCheckMol = list
                        .firstWhere((element) => element.code == item.keyCode,
                            orElse: () => SubMenuModel())
                        .code;
                    bool isCheck = isCheckMol.isNotEmpty;
                    return InkWell(
                      onTap: () {
                        FillType currentType = FillType.addDisease;
                        if (isCheck) {
                          currentType = FillType.delDisease;
                        }
                        context.read<RegisterProfileBloc>().add(FormFillType(
                            type: currentType,
                            value: SubMenuModel(
                              code: item.keyCode,
                              name: item.keyName,
                            )));
                      },
                      child: Container(
                        height: 60,
                        child: Row(
                          children: [
                            Image.asset(
                              isCheck
                                  ? 'assets/images/isCheck.png'
                                  : 'assets/images/un_check.png',
                              scale: 3,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            textSubtitle1(item.keyName, color.black87),
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
                    if (list.isNotEmpty) ...{
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          textSubtitle16Blod(
                              'เลือก ${list.length} รายการ', color.black87),
                          InkWell(
                              onTap: () {
                                context
                                    .read<RegisterProfileBloc>()
                                    .add(FormFillType(
                                      type: FillType.delAllDisease,
                                    ));
                              },
                              child: textSubtitle2(
                                  'ล้างทั้งหมด', color.Primary, false)),
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
                              child: Text(getAllCongrnital(),
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
