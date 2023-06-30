import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:health_application/ui/elderly/elderly_history/components/history_exercise/history_exercise_page.dart';
import 'package:health_application/ui/elderly/elderly_history/components/history_food/history_food_page.dart';
import 'package:health_application/ui/elderly/elderly_history/elderly_history_page.dart';
import 'package:health_application/ui/elderly/elderly_setting/elderly_setting_page.dart';
import 'package:health_application/ui/google_map/googlemap.dart';
import 'package:health_application/ui/home_page/home_page.dart';
import 'package:health_application/ui/register_profile/model/register_model.dart';
import 'package:health_application/ui/register_profile/register_profile_page.dart';
import 'package:health_application/ui/signIn_page/signIn_widget.dart';
import 'package:health_application/ui/welcome_page/welcome_page.dart';

import '../elderly/personal_medication/personal_medication_page.dart';
import '../elderly/search_volunteer/volunteer_page.dart';

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
        // var args = state.extra as RegisterModel;
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
      ]),
  GoRoute(
      path: Routes.personalMedication,
      builder: (BuildContext context, GoRouterState state) {
        return PersonalMedicationPage();
      }),
  GoRoute(
      path: Routes.elderlySettingPage,
      builder: (BuildContext context, GoRouterState state) {
        var profile = state.extra as RegisterModel;
        return ElderlySettingPage(
          profile: profile,
        );
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

  static const String personalMedication = '/personalMedicationPage';

  static const String elderlySettingPage = '/elderlySettingPage';
}
