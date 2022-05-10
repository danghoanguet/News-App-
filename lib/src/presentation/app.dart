import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_clean_base/src/core/constants/dimension_constant.dart';
import 'package:getx_clean_base/src/core/constants/string_constant.dart';
import 'package:getx_clean_base/src/presentation/app_routes.dart';
import 'package:getx_clean_base/src/presentation/app_theme.dart';
import 'package:getx_clean_base/src/presentation/pages/splash/splash_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return ScreenUtilInit(
      designSize: const Size(
        DimensionConstants.screenWidth,
        DimensionConstants.screenHeight,
      ),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        theme: AppTheme.light,
        title: StringsConstant.kMaterialAppTitle,
        defaultTransition: Transition.cupertino,
        getPages: AppPages.pages,
        home: const SplashPage(),
      ),
    );
  }
}
