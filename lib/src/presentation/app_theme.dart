import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getx_clean_base/src/core/constants/app_color.dart';

class AppTheme {
  static final ThemeData light = ThemeData(
    brightness: Brightness.light,
    dividerColor: AppColor.dividerColor,
    scaffoldBackgroundColor: AppColor.backgroundColor,
    fontFamily: "Arial",
    splashFactory: InkRipple.splashFactory,
    appBarTheme: AppBarTheme(
      color: AppColor.white,
      shadowColor: AppColor.cardShadowColor,
      elevation: 0,
      iconTheme: const IconThemeData(color: AppColor.primaryText),
      actionsIconTheme: const IconThemeData(color: AppColor.primaryText),
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: AppColor.primaryText,
        fontSize: 28.h,
        fontWeight: FontWeight.w600,
      ),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
        statusBarBrightness: Brightness.light, // For iOS (dark icons)
      ),
    ),
    drawerTheme: const DrawerThemeData(backgroundColor: AppColor.white),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: AppColor.backgroundColor,
      elevation: 1,
    ),
    popupMenuTheme: const PopupMenuThemeData(
      elevation: 2,
      color: AppColor.backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
        color: AppColor.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 30.h,
      ),
      headline2: TextStyle(
        color: AppColor.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 28.h,
      ),
      headline3: TextStyle(
        color: AppColor.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 24.h,
      ),
      headline4: TextStyle(
        color: AppColor.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 22.h,
      ),
      headline5: TextStyle(
        color: AppColor.primaryText,
        fontWeight: FontWeight.w400,
        fontSize: 20.h,
      ),
      headline6: TextStyle(
        color: AppColor.primaryText,
        fontWeight: FontWeight.w400,
        fontSize: 18.h,
      ),
      subtitle1: TextStyle(
        color: AppColor.secondaryText,
        fontWeight: FontWeight.w400,
        fontSize: 22.h,
      ),
      bodyText1: TextStyle(
        color: AppColor.primaryText,
        fontWeight: FontWeight.w400,
        fontSize: 24.h,
      ),
      bodyText2: TextStyle(
        color: AppColor.secondaryText,
        fontWeight: FontWeight.w400,
        fontSize: 22.h,
      ),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    inputDecorationTheme: InputDecorationTheme(
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(2)),
        borderSide: BorderSide(color: AppColor.primaryColor),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(2)),
        borderSide: BorderSide(color: AppColor.primaryColor),
      ),
      prefixIconColor: AppColor.gray,
      suffixIconColor: AppColor.gray,
      floatingLabelStyle: TextStyle(
        color: AppColor.primaryText,
        fontSize: 24.h,
      ),
      hintStyle: TextStyle(fontSize: 24.h),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColor.primaryColor,
    ),
  );

  /// Singleton factory
  static final AppTheme _instance = AppTheme._internal();

  factory AppTheme() {
    return _instance;
  }

  AppTheme._internal();
}
