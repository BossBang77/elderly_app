import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:health_application/ui/base/appoint_detail_card/bloc/appointment_card_bloc.dart';
import 'package:health_application/ui/base/bloc/master_data_bloc.dart';
import 'package:health_application/ui/base/data_provider.dart';
import 'package:health_application/ui/elderly/search_volunteer/bloc/search_volunteer_bloc.dart';
import 'package:health_application/ui/google_map/cubit/google_map_cubit.dart';
import 'package:health_application/ui/signIn_page/login/login_page.dart';
import 'package:health_application/ui/user_profile/bloc/user_profile_bloc.dart';
import 'package:health_application/ui/welcome_page/welcome_page.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'ui/elderly/exercise/bloc/exercise_bloc.dart';
import 'ui/elderly/water_intake/bloc/water_intake_bloc.dart';
import 'ui/home_page/bloc/home_page_bloc.dart';

void main() {
  Bloc.observer = CounterObserver();
  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );
  final storage = FlutterSecureStorage(aOptions: _getAndroidOptions());
  runApp(MyApp());
}

class CounterObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('th');
    return MultiRepositoryProvider(
        providers: <RepositoryProvider<dynamic>>[
          RepositoryProvider<DataProvider>(
              create: (BuildContext context) => DataProvider())
        ],
        child: MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => HomePageBloc()),
              BlocProvider(create: (context) => ExerciseBloc()),
              BlocProvider(create: (context) => MasterDataBloc()),
              BlocProvider(create: (context) => WaterIntakeBloc()),
              BlocProvider(create: (context) => UserProfileBloc()),
              BlocProvider(
                create: (context) => GoogleMapCubit()..initialState(),
              ),
              BlocProvider(
                create: (context) => SearchVolunteerBloc(),
              ),
              BlocProvider(
                create: (context) => AppointmentCardBloc(),
              ),
            ],
            child: Builder(builder: (context) {
              context.read<MasterDataBloc>().add(LoadMasterData());
              return ScreenUtilInit(
                  designSize: Size(375, 812),
                  builder: (context, child) => MaterialApp(
                        title: 'Elderly Health',
                        theme: ThemeData(
                          primarySwatch: Colors.blue,
                        ),
                        home: WelcomePage(),
                      ));
            })));
  }
}
