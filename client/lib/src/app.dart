import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:setiket/src/common_config/app_theme.dart';

import 'app_router.dart';
import 'common_config/palette.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 760),
      builder: (context, child) {
        return MaterialApp.router(
          title: 'SeaCinema',
          theme: ThemeData(
            canvasColor: Palette.color,
            progressIndicatorTheme: const ProgressIndicatorThemeData(
              circularTrackColor: AppTheme.thirdColor,
              color: Colors.orange,
            ),
            primarySwatch: Palette.color,
            dividerColor: Colors.transparent,
            fontFamily: 'Poppins',
            appBarTheme: AppBarTheme(
              elevation: 1,
              centerTitle: true,
              titleTextStyle: TextStyle(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: ScreenUtil().setSp(18),
                fontWeight: FontWeight.w600,
              ),
            ),
            iconTheme: const IconThemeData(
              color: Colors.white,
            ),
            scaffoldBackgroundColor: Palette.color,
            textTheme: TextTheme(
              titleLarge: TextStyle(
                  fontSize: ScreenUtil().setSp(18),
                  fontWeight: FontWeight.w600,
                  color: Colors.red),
              bodyLarge: TextStyle(
                  fontSize: ScreenUtil().setSp(14),
                  fontWeight: FontWeight.w600,
                  color: Colors.yellow),
              bodyMedium: TextStyle(
                  fontSize: ScreenUtil().setSp(14),
                  fontWeight: FontWeight.w600,
                  color: AppTheme.textColor),
              labelLarge: TextStyle(
                  fontSize: ScreenUtil().setSp(14),
                  fontWeight: FontWeight.w600,
                  color: Colors.blue),
            ),
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              elevation: 1,
              backgroundColor: Palette.color,
              selectedItemColor: AppTheme.textBlueColor,
              unselectedItemColor: AppTheme.thirdColor,
              showUnselectedLabels: true,
              showSelectedLabels: true,
            ),
          ),
          routerDelegate: goRouter.routerDelegate,
          routeInformationParser: goRouter.routeInformationParser,
          routeInformationProvider: goRouter.routeInformationProvider,
        );
      },
    );
  }
}
