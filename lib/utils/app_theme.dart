import 'package:flutter/material.dart';
import 'package:islami1/utils/app_colors.dart';
import 'package:islami1/utils/app_styles.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData(
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: AppColors.whiteColor,
      unselectedItemColor: AppColors.blackColor,
      // type: BottomNavigationBarType.fixed,
      // backgroundColor: AppColors.primaryColor,
    ),
    scaffoldBackgroundColor: AppColors.transparentColor,
    appBarTheme: AppBarTheme(
      surfaceTintColor: AppColors.blackColor,
      backgroundColor: AppColors.blackColor,
      centerTitle: true,
      titleTextStyle: AppStyles.bold20Primary,
      toolbarHeight: 89,

      iconTheme: IconThemeData(color: AppColors.primaryColor),
    ),
  );
}
