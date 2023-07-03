import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:health_application/ui/elderly/appointment/model/response/appointment.dart';
import 'package:health_application/ui/elderly/elderly_address/bloc/elderly_address_bloc.dart';
import 'package:health_application/ui/elderly/change_password/change_password_page.dart';
import 'package:health_application/ui/elderly/elderly_history/components/history_drinking/history_drinking_page.dart';
import 'package:health_application/ui/elderly/elderly_history/components/history_exercise/history_exercise_page.dart';
import 'package:health_application/ui/elderly/elderly_history/components/history_food/history_food_page.dart';
import 'package:health_application/ui/elderly/elderly_history/elderly_history_page.dart';
import 'package:health_application/ui/elderly/exercise/exercise_widget.dart';
import 'package:health_application/ui/elderly/food/model/food/meal.dart';
import 'package:health_application/ui/elderly/food_log/food_log_page.dart';
import 'package:health_application/ui/elderly/request_assistance/request_assistance_page.dart';
import 'package:health_application/ui/elderly/volunteer_appoint_summary/volunteer_appoint_summary_page.dart';
import 'package:health_application/ui/elderly/elderly_setting/elderly_setting_page.dart';
import 'package:health_application/ui/google_map/googlemap.dart';
import 'package:health_application/ui/home_page/home_page.dart';
import 'package:health_application/ui/register_profile/model/register_model.dart';
import 'package:health_application/ui/register_profile/register_profile_page.dart';
import 'package:health_application/ui/signIn_page/signIn_widget.dart';
import 'package:health_application/ui/volunteer/request_assistance_detail/request_assitance_detail_page.dart';
import 'package:health_application/ui/user_profile/profile_information/elderly_profile_information_view.dart';
import 'package:health_application/ui/welcome_page/welcome_page.dart';

import '../elderly/appointment_detail/appointment_detail_page.dart';
import '../elderly/elderly_address/view/manage_address_elderly.dart';
import '../elderly/personal_medication/personal_medication_page.dart';
import '../elderly/qr_code_elderly/qr_code_elderly_page.dart';
import '../elderly/search_volunteer/volunteer_page.dart';
import '../register_profile/volunteer/model/elderly_profile_model.dart';
import '../volunteer/search_elderly/search_elderly_page.dart';
import '../register_profile/model/register_model.dart';

final GoRouter appRouter =
    GoRouter(initialLocation: Routes.root, routes: <GoRoute>[
  GoRoute(
      path: Routes.root,
      builder: (BuildContext context, GoRouterState state) {
        return WelcomePage();
      }),
  GoRoute(
      path: Routes.login,
      builder: (BuildContext context, GoRouterState state) {
        return SignInPage();
      }),
  GoRoute(
      path: Routes.register,
      builder: (BuildContext context, GoRouterState state) {
        return RegisterProfilePage();
      },
      routes: []),
  GoRoute(
      path: Routes.home,
      builder: (BuildContext context, GoRouterState state) {
        return HomePage();
      }),
  GoRoute(
      path: Routes.map,
      builder: (BuildContext context, GoRouterState state) {
        return GoogleMaps();
      }),
  GoRoute(
      path: Routes.elderlyHistory,
      builder: (BuildContext context, GoRouterState state) {
        return ElderlyHistoryPage();
      },
      routes: [
        GoRoute(
            path: 'food-log',
            builder: (BuildContext context, GoRouterState state) {
              return HistoryFoodPage();
            }),
        GoRoute(
            path: 'exercise-log',
            builder: (BuildContext context, GoRouterState state) {
              return HistoryExercisePage();
            }),
        GoRoute(
            path: 'drinking-log',
            builder: (BuildContext context, GoRouterState state) {
              return HistoryDrinkingPage();
            }),
      ]),
  GoRoute(
      path: Routes.personalMedication,
      builder: (BuildContext context, GoRouterState state) {
        return PersonalMedicationPage();
      }),
  GoRoute(
      path: Routes.volunteerAppointSummary,
      builder: (BuildContext context, GoRouterState state) {
        var profileId = state.extra as String;
        return VolunteerAppointSummaryPage(
          profileId: profileId,
        );
      }),
  GoRoute(
      path: Routes.requestAssitanceDetail,
      builder: (BuildContext context, GoRouterState state) {
        var assistanceId = state.extra as String;
        return RequestAssitanceDetailPage(
          assistanceId: assistanceId,
        );
      }),
  GoRoute(
      path: Routes.appointmentDetail,
      builder: (BuildContext context, GoRouterState state) {
        var appointment = state.extra as Appointment;
        return AppointmentDetailPage(
          appointment: appointment,
        );
      }),
  GoRoute(
      path: Routes.manageAddressElderly,
      builder: (BuildContext context, GoRouterState state) {
        var type = state.extra as ManageAddressType;
        return ManageAddressElderly(
          type: type,
        );
      }),
  GoRoute(
      path: Routes.exerciseWidget,
      builder: (BuildContext context, GoRouterState state) {
        return ExerciseWidget();
      }),
  GoRoute(
      path: Routes.foodLog,
      builder: (BuildContext context, GoRouterState state) {
        var mealType = state.extra as MealType;
        return FoodLogPage(
          mealType: mealType,
        );
      }),
  GoRoute(
      path: Routes.googleMaps,
      builder: (BuildContext context, GoRouterState state) {
        return GoogleMaps();
      }),
  GoRoute(
      path: Routes.volunteerPage,
      builder: (BuildContext context, GoRouterState state) {
        var list = state.extra as List<dynamic>;
        return VolunteerPage(
          uid: list[0].toString(),
          ispop: list[1],
        );
      }),
  GoRoute(
      path: Routes.qrCodeElderly,
      builder: (BuildContext context, GoRouterState state) {
        var uid = state.extra as String;
        return QrCodeElderlyPage(
          uuid: uid,
        );
      }),
  GoRoute(
      path: Routes.elderlySearchDetail,
      builder: (BuildContext context, GoRouterState state) {
        var elderly = state.extra as ElderlyProfileModel;
        return ElderlySearchDetailPage(
          elderlyProfile: elderly,
        );
      }),
  GoRoute(
      path: Routes.requestAssitance,
      builder: (BuildContext context, GoRouterState state) {
        return RequestAssitancePage();
      }),
  GoRoute(
      path: Routes.elderlySettingPage,
      builder: (BuildContext context, GoRouterState state) {
        var profile = state.extra as RegisterModel;
        return ElderlySettingPage(
          profile: profile,
        );
      }),
  GoRoute(
      path: Routes.elderlyProfileInformationView,
      builder: (BuildContext context, GoRouterState state) {
        var userProfile = state.extra as RegisterModel;
        return ElderlyProfileInformationView(profile: userProfile);
      }),
  GoRoute(
      path: Routes.changePassword,
      builder: (BuildContext context, GoRouterState state) {
        var userProfile = state.extra as RegisterModel;
        return ChangePasswordPage(profile: userProfile);
      }),
]);

class Routes {
  ///root path return '/'
  static const String root = '/';

  // login
  static const String login = '/login';

  // register
  static const String register = '/register';

  // register volunteer
  static const String registerVolunteer = '/register/volunteer';

  // register volunteer
  static const String registerElderly = '/register/elderly';

  // forget password
  static const String forgetPassword = '/forget-password';

  static const String home = '/home';

  static const String map = '/map';

  static const String elderlyHistory = '/elderly-history';

  static const String elderlyHistoryFood = '/elderly-history/food-log';

  static const String elderlyHistoryExercise = '/elderly-history/exercise-log';

  static const String elderlyHistoryDrinking = '/elderly-history/drinking-log';

  static const String personalMedication = '/personalMedicationPage';

  static const String volunteerAppointSummary = '/VolunteerAppointSummaryPage';

  static const String requestAssitanceDetail = '/RequestAssitanceDetailPage';
  static const String appointmentDetail = '/AppointmentDetail';
  static const String manageAddressElderly = '/ManageAddressElderly';
  static const String exerciseWidget = '/ExerciseWidge';
  static const String foodLog = '/foodLog';
  static const String googleMaps = '/GoogleMaps';
  static const String volunteerPage = '/volunteerPage';
  static const String qrCodeElderly = '/qrCodeElderly';
  static const String elderlySearchDetail = '/elderlySearchDetail';
  static const String requestAssitance = '/requestAssitance';
  static const String elderlySettingPage = '/elderlySettingPage';
  static const String elderlyProfileInformationView =
      '/elderlyProfileInformationView';

  static const String changePassword = '/changePassword';
}
