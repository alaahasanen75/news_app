import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/layOutScrrens.dart/app_cubit.dart/appstate.dart';
import 'package:flutter_application_2/layOutScrrens.dart/chared_prefrances.dart';
import 'package:flutter_application_2/layOutScrrens.dart/cubit.dart/appCubit.dart';
import 'package:flutter_application_2/layOutScrrens.dart/dio_helper.dart';
import 'package:flutter_application_2/layOutScrrens.dart/homScreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import 'layOutScrrens.dart/app_cubit.dart/appcubit.dart';
import 'layOutScrrens.dart/cubit.dart/state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CachHelper.init();
  bool? isDark = CachHelper.getData(
    key: 'isDark',
  );
  runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget {
  // const MyApp(bool? isDark, {super.key});
  final bool? isDark;
  MyApp(this.isDark);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (BuildContext context) => AppCubit()..getbusiness()..getScience()..getSports(),
          ),
          BlocProvider(
            create: (context) => appCubit()
              ..changeAppMode(
                fromShared: isDark,
              ),
          )
        ],
        child: BlocConsumer<appCubit, appStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              themeMode: appCubit.get(context).isDark
                  ? ThemeMode.dark
                  : ThemeMode.light,
              darkTheme: ThemeData(
                scaffoldBackgroundColor: HexColor('333739'),
                primarySwatch: Colors.deepOrange,
                // scaffoldBackgroundColor: Colors.white,
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  selectedItemColor: Colors.deepOrange,
                  unselectedItemColor: Colors.grey,
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: HexColor('333739'),
                ),
                appBarTheme: AppBarTheme(
                  titleSpacing: 20,
                  iconTheme: IconThemeData(color: Colors.white),
                  backgroundColor: HexColor('333739'),
                  // ignore: deprecated_member_use
                  backwardsCompatibility: false,
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarIconBrightness: Brightness.light,
                      statusBarColor: HexColor('333739')),
                  // ignore: deprecated_member_use
                  titleTextStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                  elevation: 0,
                ),
                textTheme: TextTheme(
                    bodyText1: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white)),
              ),
              theme: ThemeData(
                primarySwatch: Colors.deepOrange,
                scaffoldBackgroundColor: Colors.white,
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  selectedItemColor: Colors.deepOrange,
                  unselectedItemColor: Colors.grey,
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: Colors.white,
                ),
                appBarTheme: const AppBarTheme(
                  titleSpacing: 20,

                  iconTheme: IconThemeData(color: Colors.black),
                  backgroundColor: Colors.white,
                  // ignore: deprecated_member_use
                  backwardsCompatibility: false,
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarIconBrightness: Brightness.dark,
                      statusBarColor: Colors.white),
                  // ignore: deprecated_member_use
                  titleTextStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                  elevation: 0,
                ),
                textTheme: TextTheme(
                    bodyText1: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black)),
              ),
              home: Directionality(
                  textDirection: TextDirection.rtl, child: Home()),
            );
          },
        ));
  }
}
