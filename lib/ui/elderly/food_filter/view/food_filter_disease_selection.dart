import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_application/ui/base/bloc/master_data_bloc.dart';
import 'package:health_application/ui/base/model/master_data.dart';
import 'package:health_application/ui/base/model/master_data_detail.dart';
import 'package:health_application/ui/base/widget/app_bar_widget.dart';
import 'package:health_application/ui/base/widget/button_gradient.dart';
import 'package:health_application/ui/base/widget/text_field_widget.dart';
import 'package:health_application/ui/elderly/food_filter/bloc/master_data_select/master_data_select_bloc.dart';
import 'package:health_application/ui/elderly/food_filter/bloc/master_data_select/master_data_select_event.dart';
import 'package:health_application/ui/elderly/food_filter/bloc/master_data_select/master_data_select_state.dart';
import 'package:health_application/ui/register_profile/bloc/register_profile_bloc.dart';
import 'package:health_application/ui/register_profile/model/sub_menu_model.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

class FoodFilterMasterDataSelectWidget extends StatelessWidget {
  const FoodFilterMasterDataSelectWidget({
    this.onSubmit,
    required this.masterData,
    this.initialValue = const[]
  });

  final List<SubMenuModel> initialValue;
  final Function(List<SubMenuModel>)? onSubmit;
  final MasterData masterData;

  @override
  Widget build(BuildContext context) {
    var sized = MediaQuery.of(context).size;


    List<MasterDataDetail> filterMasterData(String filterText) {
      List<MasterDataDetail> masterDataList = [];
      masterData.data.forEach((master) {
        if (master.keyName.contains(filterText)) {
          masterDataList.add(master);
        }
      });

      return masterDataList;
    }

    String getAllCongrnital(List<SubMenuModel> list) {
      String allName = '';
      list.forEach((element) {
        allName = allName + '${allName.isNotEmpty ? ',' : ''}' + element.name;
      });
      return allName;
    }

    return BlocProvider(
      create: (context) => MasterDataSelectBloc()..add(MasterDataSelectInitialValue(value: initialValue)),
      child: BlocBuilder<MasterDataSelectBloc, MasterDataSelectState> (
        builder: (context, state) => Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: appBar(
              onBack: () {
                Navigator.of(context).pop();
              },
              title: 'โรคประจำตัว'),
              backgroundColor: Colors.white,
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
                      text: state.searchText,
                      hintText: 'ค้นหาโรคประจำตัว',
                      prefix: true,
                      prefixTxt: null,
                      imagePathPrefix: 'assets/images/search_icon.png',
                      maxLength: 100,
                      onChanged: (value) {
                        context.read<MasterDataSelectBloc>().add(MasterDataSelectSearchValueChanged(value: value));
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                        child: ListView.separated(
                      padding: const EdgeInsets.all(8),
                      itemCount: filterMasterData(state.searchText).length,
                      itemBuilder: (BuildContext context, int index) {
                        MasterDataDetail item = filterMasterData(state.searchText)[index];

                        String isCheckMol = state.selectedItem
                            .firstWhere((element) => element.code == item.keyCode,
                                orElse: () => SubMenuModel())
                            .code;
                        bool isCheck = isCheckMol.isNotEmpty;
                        return InkWell(
                          onTap: () {
                            if (!isCheck) {
                              context.read<MasterDataSelectBloc>().add(MasterDataSelectValueSelected(value: SubMenuModel(
                                code: item.keyCode,
                                name: item.keyName
                              )));
                            } else {
                              context.read<MasterDataSelectBloc>().add(MasterDataSelectValueRemoved(value: SubMenuModel(
                                code: item.keyCode,
                                name: item.keyName
                              )));
                            }
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
                        if (state.selectedItem.isNotEmpty) ...{
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              textSubtitle16Blod(
                                  'เลือก ${state.selectedItem.length} รายการ', color.black87),
                              InkWell(
                                  onTap: () {
                                    context
                                        .read<MasterDataSelectBloc>()
                                        .add(MasterDataSelectValueRemovedAll());
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
                                  child: Text(getAllCongrnital(state.selectedItem),
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
                            onSubmit?.call(state.selectedItem);
                            Navigator.of(context).pop();
                            // context.read<RegisterProfileBloc>().add(
                            //     ChangeProfileView(
                            //         profileType: ProfileType.foodAllergies));
                          },
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        )
      ),
    );
  }
}