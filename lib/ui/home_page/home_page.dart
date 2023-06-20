import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/base/user_secure_storage.dart';
import 'package:health_application/ui/elderly/appointment/appointment_list_page.dart';
import 'package:health_application/ui/elderly/food/food_page.dart';
import 'package:health_application/ui/elderly/exercise/exercise_page.dart';
import 'package:health_application/ui/elderly/water_intake/water_intake_page.dart';
import 'package:health_application/ui/home_page/bloc/home_page_bloc.dart';
import 'package:health_application/ui/home_page/component/menu_item.dart';
import 'package:health_application/ui/home_page/home_widget.dart';
import 'package:health_application/ui/home_page/volunteer_home_widget.dart';
import 'package:health_application/ui/register_profile/bloc/register_profile_bloc.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/loaddingScreen.dart';
import 'package:health_application/ui/user_profile/user_profile_page.dart';

import '../ui-extensions/font.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<HomePageBloc>().add(Initstate());
    return Scaffold(
        body: BlocConsumer<HomePageBloc, HomePageState>(
      listener: (context, state) {},
      builder: (BuildContext context, HomePageState state) {
        void changemenu(menuType menus) {
          context.read<HomePageBloc>().add(ChangeMenu(menus: menus));
        }

        Widget _bottomNavigationBar() {
          return Align(
            alignment: Alignment.bottomCenter,
            child: Card(
              margin: EdgeInsets.zero,
              color: Colors.transparent,
              shadowColor: Colors.grey,
              elevation: 10,
              child: Container(
                decoration: BoxDecoration(
                    color: ColorTheme().white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                height: 90,
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    menuItem(
                      context,
                      imgIsSelect: 'assets/images/home_enable.png',
                      imgUnSelect: 'assets/images/home_disable.png',
                      isSelect: state.menus == menuType.mainPage,
                      onTap: () {
                        changemenu(menuType.mainPage);
                      },
                      title: 'หน้าหลัก',
                    ),
                    menuItem(
                      context,
                      imgIsSelect: 'assets/images/food_enable.png',
                      imgUnSelect: 'assets/images/food_disable.png',
                      isSelect: state.menus == menuType.foodPage,
                      onTap: () {
                        changemenu(menuType.foodPage);
                      },
                      title: 'อาหาร',
                    ),
                    menuItem(
                      context,
                      imgIsSelect: 'assets/images/exercise_enable.png',
                      imgUnSelect: 'assets/images/exercise_disable.png',
                      isSelect: state.menus == menuType.exercisePage,
                      onTap: () {
                        changemenu(menuType.exercisePage);
                      },
                      title: 'ออกกำลังกาย',
                    ),
                    menuItem(
                      context,
                      imgIsSelect: 'assets/images/drinking_enable.png',
                      imgUnSelect: 'assets/images/drinking_disable.png',
                      isSelect: state.menus == menuType.drinkingPage,
                      onTap: () {
                        changemenu(menuType.drinkingPage);
                      },
                      title: 'ดื่มน้ำ',
                    ),
                    menuItem(
                      context,
                      imgIsSelect: 'assets/images/profile_enable.png',
                      imgUnSelect: 'assets/images/profile_disable.png',
                      isSelect: state.menus == menuType.profilePage,
                      onTap: () {
                        changemenu(menuType.profilePage);
                      },
                      title: 'โปรไฟล์',
                    ),
                  ],
                ),
              ),
            ),
          );
        }

        Widget _volunteerButtonNavagateBar() {
          return Align(
            alignment: Alignment.bottomCenter,
            child: Card(
              margin: EdgeInsets.zero,
              color: Colors.transparent,
              shadowColor: Colors.grey,
              elevation: 10,
              child: Container(
                decoration: BoxDecoration(
                    color: ColorTheme().white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                height: 90,
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    menuItem(
                      context,
                      imgIsSelect: 'assets/images/home_enable.png',
                      imgUnSelect: 'assets/images/home_disable.png',
                      isSelect: state.menus == menuType.mainPage,
                      onTap: () {
                        changemenu(menuType.mainPage);
                      },
                      title: 'หน้าหลัก',
                    ),
                    menuItem(
                      context,
                      imgIsSelect:
                          'assets/images/calendar_appointment_blue.png',
                      imgUnSelect: 'assets/images/calendar_appointment.png',
                      isSelect: state.menus == menuType.appointment,
                      onTap: () {
                        changemenu(menuType.appointment);
                      },
                      title: 'นัดหมาย',
                    ),
                    menuItem(
                      context,
                      imgIsSelect: 'assets/images/menu_message_blue.png',
                      imgUnSelect: 'assets/images/menu_message.png',
                      isSelect: state.menus == menuType.message,
                      onTap: () {
                        changemenu(menuType.message);
                      },
                      title: 'ข้อความ',
                    ),
                    menuItem(
                      context,
                      imgIsSelect: 'assets/images/profile_enable.png',
                      imgUnSelect: 'assets/images/profile_disable.png',
                      isSelect: state.menus == menuType.profilePage,
                      onTap: () {
                        changemenu(menuType.profilePage);
                      },
                      title: 'โปรไฟล์',
                    ),
                  ],
                ),
              ),
            ),
          );
        }

        Widget _volunteerPageView() {
          switch (state.menus) {
            case menuType.mainPage:
              return VolunteerHomeWidget();
            case menuType.appointment:
              return AppointmentListPage();
            case menuType.profilePage:
              return UserProfilePage();
            // TODO case next page

            default:
              return Container(
                child: Center(
                    child: textButton1(
                        state.menus.name.toUpperCase(), ColorTheme().Primary)),
              );
          }
        }

        Widget _pageView() {
          switch (state.menus) {
            case menuType.mainPage:
              return HomeWidget();
            case menuType.drinkingPage:
              return WaterIntakePage();
            case menuType.exercisePage:
              return ExercisePage();
            case menuType.foodPage:
              return FoodPage();
            case menuType.profilePage:
              return UserProfilePage();
            // TODO case next page

            default:
              return Container(
                child: Center(
                    child: textButton1(
                        state.menus.name.toUpperCase(), ColorTheme().Primary)),
              );
          }
        }

        return Stack(
          children: [
            if (state.role == RoleType.ROLE_USER_ELDERLY.name) ...{
              _pageView(),
              _bottomNavigationBar()
            } else ...{
              _volunteerPageView(),
              _volunteerButtonNavagateBar()
            },
            if (state.loading) ...{Loader()}
          ],
        );
      },
    ));
  }
}
