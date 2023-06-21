import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:health_application/ui/base/appoint_detail_card/bloc/appointment_card_bloc.dart';
import 'package:health_application/ui/base/bloc/master_data_bloc.dart';
import 'package:health_application/ui/base/cubit/expired_cubit.dart';
import 'package:health_application/ui/base/data_provider.dart';
import 'package:health_application/ui/base/emergency_detail_card/bloc/emergency_detail_card_bloc.dart';
import 'package:health_application/ui/base/network_provider.dart';
import 'package:health_application/ui/base/routes.dart';
import 'package:health_application/ui/elderly/search_volunteer/bloc/search_volunteer_bloc.dart';
import 'package:health_application/ui/google_map/cubit/google_map_cubit.dart';
import 'package:health_application/ui/home_page/repository/tdee_repository.dart';
import 'package:health_application/ui/user_profile/bloc/user_profile_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'ui/base/app_config/conflig.dart';
import 'ui/base/token_expired/token_expired.dart';
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
    final NetworkProvider networkProvider = ConfigEnv.networkProvider;

    networkProvider.alice
        .setNavigatorKey(appRouter.routerDelegate.navigatorKey);
    initializeDateFormatting('th');
    return MultiRepositoryProvider(
        providers: <RepositoryProvider<dynamic>>[
          RepositoryProvider<DataProvider>(
              create: (BuildContext context) => DataProvider())
        ],
        child: MultiBlocProvider(
            providers: [
              BlocProvider(
                  create: (context) =>
                      HomePageBloc(TDEERepository())..fetchTDEEData()),
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
              BlocProvider(
                create: (context) => TokenExpiredCubit(),
                child: TokenExpiredWidget(),
              ),
              BlocProvider(
                  create: (context) =>
                      EmergencyDetailCardBloc()..add(GetEmergencyList()))
            ],
            child: Builder(builder: (context) {
              context.read<MasterDataBloc>().add(LoadMasterData());
              return ScreenUtilInit(
                  designSize: Size(375, 812),
                  builder: (context, child) {
                    return MaterialApp.router(
                      title: 'Elderly Health',
                      theme: ThemeData(
                        primarySwatch: Colors.blue,
                      ),
                      routeInformationProvider:
                          appRouter.routeInformationProvider,
                      routeInformationParser: appRouter.routeInformationParser,
                      routerDelegate: appRouter.routerDelegate,
                      debugShowCheckedModeBanner: false,
                      localizationsDelegates: [
                        DefaultMaterialLocalizations.delegate,
                        DefaultWidgetsLocalizations.delegate,
                        GlobalWidgetsLocalizations.delegate,
                        GlobalMaterialLocalizations.delegate,
                        MonthYearPickerLocalizations.delegate,
                      ],
                      builder: (BuildContext context, Widget? child) {
                        return Stack(children: <Widget>[
                          if (child != null) child,
                          // GlobalLoaderOverlay(
                          //     overlayColor: Colors.grey,
                          //     overlayOpacity: 0.6,
                          //     child: child),
                        ]);
                      },
                    );
                  });
            })));
  }
}
