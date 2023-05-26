import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:health_application/ui/base/widget/app_bar_widget.dart';
import 'package:health_application/ui/base/widget/button_gradient.dart';
import 'package:health_application/ui/base/widget/text_field_widget.dart';
import 'package:health_application/ui/register_profile/bloc/register_profile_bloc.dart';
import 'package:health_application/ui/ui-extensions/color.dart';

class DiseaseWidget extends StatelessWidget {
  const DiseaseWidget({super.key, required this.state});
  final RegisterProfileState state;
  @override
  Widget build(BuildContext context) {
    void _modalBottomSheetMenu() {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await showModalBottomSheet(
            context: context,
            builder: (builder) {
              return new Container(
                height: 350.0,
                color: Colors
                    .transparent, //could change this to Color(0xFF737373),
                //so you don't have to change MaterialApp canvasColor
                child: new Container(
                    decoration: new BoxDecoration(
                        color: Colors.white,
                        borderRadius: new BorderRadius.only(
                            topLeft: const Radius.circular(10.0),
                            topRight: const Radius.circular(10.0))),
                    child: new Center(
                      child: new Text("This is a modal sheet"),
                    )),
              );
            });
      });
    }

    var sized = MediaQuery.of(context).size;

    // _modalBottomSheetMenu();
    return Scaffold(
      // backgroundColor: ColorTheme().whiteBackground,
      appBar: appBar(
          onBack: () {
            //TODO
          },
          title: 'โรคประจำตัว'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 4,
            child: Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Column(children: [
                const SizedBox(
                  height: 10,
                ),
                // TextFieldWidget.enable(
                //   text: '',
                //   hintText: 'ค้นหาโรคประจำตัว',
                //   prefix: true,
                //   prefixTxt: null,
                //   imagePathPrefix: 'assets/images/search_icon.png',
                //   maxLength: 100,
                // ),
                // Expanded(child: Container(ch)),
              ]),
            ),
          ),
          Flexible(
              child: Container(
            height: sized.height * 0.25,
            decoration: BoxDecoration(
              color: ColorTheme().white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: ColorTheme().GreyBackGround,
                  blurRadius: 10.0,
                ),
              ],
            ),
          ))

          // ButtonGradient(
          //   btnName: 'ยืนยัน',
          //   onClick: () {
          //     if (state.roleType != RoleType.initial)
          //       context.read<RegisterProfileBloc>().add(ChangeProfileView(
          //           profileType: ProfileType.privacyProfile));
          //   },
          // )
        ],
      ),
    );
  }
}
