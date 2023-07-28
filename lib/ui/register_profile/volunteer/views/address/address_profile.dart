import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/base/master_address/bloc/master_address_bloc.dart';
import 'package:health_application/ui/base/widget/app_bar_widget.dart';
import 'package:health_application/ui/base/widget/button_gradient.dart';
import 'package:health_application/ui/base/widget/dropdown_widget.dart';
import 'package:health_application/ui/base/widget/space_widget.dart';
import 'package:health_application/ui/base/widget/title_header.dart';
import 'package:health_application/ui/extension/master_data_extension.dart';
import 'package:health_application/ui/extension/string_extension.dart';
import 'package:health_application/ui/register_profile/bloc/register_profile_bloc.dart';
import 'package:health_application/ui/register_profile/model/addresses_detail.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import '../../../../base/master_address/model/address_detail.dart';
import '../../../../base/widget/text_field_widget.dart';
import '../../bloc/volunteer_register_bloc.dart';

class AddressProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(
            title: 'โปรไฟล์ของฉัน',
            onBack: () {
              context.read<RegisterProfileBloc>().add(ChangeProfileView(
                  profileType: ProfileType.personalInformation));
            }),
        backgroundColor: ColorTheme().white,
        body: SingleChildScrollView(
            child: BlocBuilder<MasterAddressBloc, MasterAddressState>(
          builder: (mastercontext, masterState) {
            List<AddressDetail> masterProvince = masterState.province;
            List<AddressDetail> masterDistrict = masterState.district;
            List<AddressDetail> masterSubDistrict = masterState.subDistrict;
            List<String> masterzipCode = [
              ...{...masterState.zipCode}
            ];

            return BlocBuilder<VolunteerRegisterBloc, VolunteerRegisterState>(
              builder: (context, state) {
                var addList = [...state.registerData.addresses];
                var currentForm =
                    getAddress(addList, AddressType.CONTACT_ADDRESS) ??
                        AddressDetailModel();

                return Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SpaceWidget(
                          height: 20,
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
                                    onChanged: (value) {
                                      context.read<VolunteerRegisterBloc>().add(
                                          UpdateValue(
                                              type: FormFieldType.addressNo,
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
                                  hintText: 'เลขที่ห้อง',
                                  onChanged: (value) {
                                    context.read<VolunteerRegisterBloc>().add(
                                        UpdateValue(
                                            type: FormFieldType.roomNo,
                                            value: value));
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
                                    hintText: 'ชั้น',
                                    onChanged: (value) {
                                      context.read<VolunteerRegisterBloc>().add(
                                          UpdateValue(
                                              type: FormFieldType.floor,
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
                                  onChanged: (value) {
                                    context.read<VolunteerRegisterBloc>().add(
                                        UpdateValue(
                                            type: FormFieldType.moo,
                                            value: value));
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
                                    onChanged: (value) {
                                      context.read<VolunteerRegisterBloc>().add(
                                          UpdateValue(
                                              type: FormFieldType.soi,
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
                                    title: 'อาคาร/หมู่บ้าน',
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextFieldWidget.enable(
                                    text: currentForm.buildVillageName,
                                    maxLength: 50,
                                    hintText: 'อาคาร/หมู่บ้าน',
                                    onChanged: (value) {
                                      context.read<VolunteerRegisterBloc>().add(
                                          UpdateValue(
                                              type: FormFieldType.buildingName,
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
                                    onChanged: (value) {
                                      context.read<VolunteerRegisterBloc>().add(
                                          UpdateValue(
                                              type: FormFieldType.road,
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
                                    value: currentForm.province
                                        .takeOrNullIfEmpty(),
                                    items: masterProvince
                                        .map((master) => master.name)
                                        .toList(),
                                    onChanged: (value) {
                                      var provinceCode = masterProvince
                                          .getCodeByName(value ?? "");

                                      mastercontext
                                          .read<MasterAddressBloc>()
                                          .add(LoadMasterDistrict(
                                              provinceCode: provinceCode));

                                      context.read<VolunteerRegisterBloc>().add(
                                          UpdateValue(
                                              type: FormFieldType.province,
                                              value: value ?? ''));
                                    },
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
                                    value: currentForm.district
                                        .takeOrNullIfEmpty(),
                                    items: masterDistrict
                                        .map((master) => master.name)
                                        .toList(),
                                    enable: currentForm.province.isNotEmpty,
                                    onChanged: (value) {
                                      var districtCode = masterDistrict
                                          .getCodeByName(value ?? "");

                                      mastercontext
                                          .read<MasterAddressBloc>()
                                          .add(LoadMasterSubDistrict(
                                              districtCode: districtCode));
                                      context.read<VolunteerRegisterBloc>().add(
                                          UpdateValue(
                                              type: FormFieldType.district,
                                              value: value ?? ''));
                                    },
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
                                    value: currentForm.subDistrict
                                        .takeOrNullIfEmpty(),
                                    items: masterSubDistrict
                                        .map((master) => master.name)
                                        .toList(),
                                    enable: currentForm.district.isNotEmpty,
                                    onChanged: (value) {
                                      var zipCode = masterSubDistrict
                                          .getZipCodeByName(value ?? "");

                                      context.read<VolunteerRegisterBloc>().add(
                                          UpdateValue(
                                              type: FormFieldType.subdistrict,
                                              value: value ?? ""));

                                      context.read<VolunteerRegisterBloc>().add(
                                          UpdateValue(
                                              type: FormFieldType.postalCode,
                                              value: zipCode));
                                    },
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
                                    value: currentForm.postalCode
                                        .takeOrNullIfEmpty(),
                                    items: masterzipCode,
                                    enable: currentForm.subDistrict.isNotEmpty,
                                    onChanged: (value) {
                                      context.read<VolunteerRegisterBloc>().add(
                                          UpdateValue(
                                              type: FormFieldType.postalCode,
                                              value: value ?? ''));
                                    },
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
                          btnName: 'ถัดไป',
                          onClick: () {
                            if (checkMandatory(currentForm)) {
                              context.read<RegisterProfileBloc>().add(
                                  ChangeProfileView(
                                      profileType:
                                          ProfileType.workInformation));
                            }
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
          },
        )));
  }
}
