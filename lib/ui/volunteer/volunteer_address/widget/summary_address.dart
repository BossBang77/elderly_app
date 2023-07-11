import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/base/widget/button_gradient.dart';
import 'package:health_application/ui/base/widget/space_widget.dart';
import 'package:health_application/ui/register_profile/model/addresses_detail.dart';
import 'package:health_application/ui/volunteer/volunteer_address/bloc/volunteer_address_bloc.dart';
import 'package:health_application/ui/volunteer/volunteer_address/component/address_card.dart';

class SummaryAddress extends StatelessWidget {
  const SummaryAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VolunteerAddressBloc, VolunteerAddressState>(
      builder: (context, state) {
        var addressList = [...state.profile.addresses];
        var contactAddress =
            getAddress(addressList, AddressType.CONTACT_ADDRESS);
        var registerAddress =
            getAddress(addressList, AddressType.REGISTER_ADDRESS);
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SpaceWidget(
                  height: 40,
                ),
                AddressCard(
                  type: AddressType.CONTACT_ADDRESS,
                  onTap: () {
                    context.read<VolunteerAddressBloc>().add(EditOrAddForm(
                        profile: state.profile,
                        type: AddressType.CONTACT_ADDRESS));
                  },
                  isNotEmptyAddress: contactAddress != null,
                  addressDetail: contactAddress ?? AddressDetailModel(),
                ),
                SpaceWidget(
                  height: 40,
                ),
                AddressCard(
                  type: AddressType.REGISTER_ADDRESS,
                  onTap: () {
                    context.read<VolunteerAddressBloc>().add(EditOrAddForm(
                        profile: state.profile,
                        type: AddressType.REGISTER_ADDRESS));
                  },
                  isNotEmptyAddress: registerAddress != null,
                  addressDetail: registerAddress ?? AddressDetailModel(),
                )
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: ButtonGradient(
                    btnName: 'บันทึก',
                    onClick: () {
                      context.read<VolunteerAddressBloc>().add(SubmitForm());
                    },
                  ),
                ),
                SpaceWidget(
                  height: 40,
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
