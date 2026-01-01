import 'package:flutter/material.dart';
import 'package:islami1/datails_screen/details_screen.dart';
import 'package:islami1/intro_screen/intro_screen.dart';
import 'package:islami1/utils/app_routes.dart';
import 'package:islami1/utils/app_theme.dart';
import 'package:islami1/utils/provider.dart';
import 'package:islami1/utils/shared_prefs_utils.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  final bool showIntro =
      sharedPreferences.getBool(SharedPrefsKeys.introScreenKey) ?? true;
  runApp(
    ChangeNotifierProvider(
      create: (context) => MostRecentProvider(),
      child: MyApp(showIntro: showIntro),
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool showIntro;

  const MyApp({super.key, required this.showIntro});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: showIntro
          ? AppRoutes.introRouteName
          : AppRoutes.homeRouteName,
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
