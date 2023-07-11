import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/base/widget/button_gradient.dart';
import 'package:health_application/ui/base/widget/dropdown_widget.dart';
import 'package:health_application/ui/base/widget/space_widget.dart';
import 'package:health_application/ui/base/widget/title_header.dart';
import 'package:health_application/ui/register_profile/model/addresses_detail.dart';
import 'package:health_application/ui/ui-extensions/font.dart';
import 'package:health_application/ui/volunteer/volunteer_address/bloc/volunteer_address_bloc.dart';

import '../../../base/widget/text_field_widget.dart';
import '../../../ui-extensions/color.dart';

class FillVolunteerAddress extends StatelessWidget {
  const FillVolunteerAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VolunteerAddressBloc, VolunteerAddressState>(
      builder: (context, state) {
        var typeChange = state.typeChange;
        var currentForm =
            getAddress(state.currentChange.addresses, typeChange) ??
                AddressDetailModel();

        var registerAddress = getAddress(
            state.currentChange.addresses, AddressType.REGISTER_ADDRESS);

        bool enable = typeChange == AddressType.REGISTER_ADDRESS
            ? true
            : !state.selectSameRegister;

        return Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SpaceWidget(
                  height: 20,
                ),
                textSubtitle16Blod(typeChange.title, color.black87),
                if (typeChange == AddressType.CONTACT_ADDRESS)
                  InkWell(
                    onTap: () {
                      if (registerAddress != null) {
                        context.read<VolunteerAddressBloc>().add(ChangeForm(
                            fillType: TypeAddress.selectSameRegister,
                            value: registerAddress));
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          constraints: BoxConstraints(minHeight: 50),
                          child: Image.asset(
                            state.selectSameRegister
                                ? 'assets/images/check_box_check.png'
                                : 'assets/images/check_box_uncheck.png',
                            scale: 4,
                            alignment: Alignment.centerLeft,
                          ),
                        ),
                        textSubtitle16W500(
                            'เหมือนที่อยู่ตามทะเบียนบ้าน',
                            registerAddress != null
                                ? color.black87
                                : color.greyText),
                      ],
                    ),
                  ),
                SpaceWidget(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TitleHeaderWidget(
                            title: 'เลขที่',
                            isMandatory: true,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFieldWidget.enable(
                            text: currentForm.addressNo,
                            maxLength: 50,
                            hintText: 'เลขที่',
                            enable: enable,
                            onChanged: (value) {
                              context.read<VolunteerAddressBloc>().add(
                                  ChangeForm(
                                      fillType: TypeAddress.addressNo,
                                      value: value));
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitleHeaderWidget(
                          title: 'เลขที่ห้อง',
                          isMandatory: false,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFieldWidget.enable(
                          text: currentForm.roomNo,
                          textNumberType: true,
                          maxLength: 50,
                          enable: enable,
                          hintText: 'เลขที่ห้อง',
                          onChanged: (value) {
                            context.read<VolunteerAddressBloc>().add(ChangeForm(
                                fillType: TypeAddress.roomNo, value: value));
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ))
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TitleHeaderWidget(
                            title: 'ชั้น',
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFieldWidget.enable(
                            text: currentForm.floor,
                            textNumberType: true,
                            maxLength: 50,
                            enable: enable,
                            hintText: 'ชั้น',
                            onChanged: (value) {
                              context.read<VolunteerAddressBloc>().add(
                                  ChangeForm(
                                      fillType: TypeAddress.floor,
                                      value: value));
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitleHeaderWidget(
                          title: 'หมู่ที่',
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFieldWidget.enable(
                          text: currentForm.moo,
                          textNumberType: true,
                          maxLength: 50,
                          hintText: 'หมู่ที่',
                          enable: enable,
                          onChanged: (value) {
                            context.read<VolunteerAddressBloc>().add(ChangeForm(
                                fillType: TypeAddress.moo, value: value));
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ))
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TitleHeaderWidget(
                            title: 'ซอย',
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFieldWidget.enable(
                            text: currentForm.soi,
                            maxLength: 50,
                            hintText: 'ซอย',
                            enable: enable,
                            onChanged: (value) {
                              context.read<VolunteerAddressBloc>().add(
                                  ChangeForm(
                                      fillType: TypeAddress.soi, value: value));
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TitleHeaderWidget(
                            title: 'อาคาร/หมู่บ้าน',
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFieldWidget.enable(
                            text: currentForm.buildVillageName,
                            maxLength: 50,
                            hintText: 'อาคาร/หมู่บ้าน',
                            enable: enable,
                            onChanged: (value) {
                              context.read<VolunteerAddressBloc>().add(
                                  ChangeForm(
                                      fillType: TypeAddress.buildingName,
                                      value: value));
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TitleHeaderWidget(
                            title: 'ถนน',
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFieldWidget.enable(
                            text: currentForm.road,
                            maxLength: 50,
                            hintText: 'ถนน',
                            enable: enable,
                            onChanged: (value) {
                              context.read<VolunteerAddressBloc>().add(
                                  ChangeForm(
                                      fillType: TypeAddress.road,
                                      value: value));
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TitleHeaderWidget(
                            title: 'จังหวัด',
                            isMandatory: true,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          DropdownWidget(
                            value: null,
                            items: [],
                            enable: enable,
                            onChanged: (value) {},
                            hint: 'จังหวัด',
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TitleHeaderWidget(
                            title: 'เขต/อำเภอ',
                            isMandatory: true,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          DropdownWidget(
                            value: null,
                            items: [],
                            enable: enable,
                            onChanged: (value) {},
                            hint: 'เขต/อำเภอ',
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TitleHeaderWidget(
                            title: 'แขวง/ตำบล',
                            isMandatory: true,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          DropdownWidget(
                            value: null,
                            items: [],
                            enable: enable,
                            onChanged: (value) {},
                            hint: 'แขวง/ตำบล',
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TitleHeaderWidget(
                            title: 'รหัสไปรษณีย์',
                            isMandatory: true,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          DropdownWidget(
                            value: null,
                            items: [],
                            enable: enable,
                            onChanged: (value) {},
                            hint: 'รหัสไปรษณีย์',
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                ButtonGradient(
                  btnName: 'ยืนยัน',
                  onClick: () {
                    context.read<VolunteerAddressBloc>().add(ConfirmAddress());
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
