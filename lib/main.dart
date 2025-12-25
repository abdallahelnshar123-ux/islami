import 'package:flutter/material.dart';
import 'package:islami1/datails_screen/details_screen.dart';
import 'package:islami1/intro_screen/intro_screen.dart';
import 'package:islami1/utils/app_routes.dart';
import 'package:islami1/utils/app_theme.dart';

import 'home/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.homeRouteName,
      routes: {
        AppRoutes.homeRouteName: (context) => HomeScreen(),
        AppRoutes.introRouteName: (context) => IntroScreen(),
        AppRoutes.detailsRouteName: (context) => DetailsScreen(),
      },
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}
