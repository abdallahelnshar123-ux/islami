import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islami1/utils/app_assets.dart';
import 'package:islami1/utils/app_colors.dart';
import 'package:islami1/utils/app_routes.dart';
import 'package:islami1/utils/app_styles.dart';
import 'package:islami1/utils/screen_size.dart';
import 'package:islami1/utils/shared_prefs_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroScreen extends StatefulWidget {
  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      globalBackgroundColor: AppColors.blackColor,
      pages: [
        builtPageView(
          AppAssets.introImage1,
          context,
          'Welcome To Islmi App',
          '',
        ),
        builtPageView(
          AppAssets.introImage2,
          context,
          'Welcome To Islmi ',
          'We Are Very Excited To Have You In Our Community',
        ),
        builtPageView(
          AppAssets.introImage3,
          context,
          'Reading the Quran',
          'Read, and your Lord is the Most Generous',
        ),
        builtPageView(
          AppAssets.introImage4,
          context,
          'Bearish',
          'Praise the name of your Lord, the Most High',
        ),
        builtPageView(
          AppAssets.introImage5,
          context,
          'Holy Quran Radio',
          'You can listen to the Holy Quran Radio through '
              'the application for free and easily ',
        ),
      ],
      freeze: true,
      showSkipButton: false,
      showBackButton: true,
      back: const Text("Back", style: AppStyles.bold15Primary),
      next: const Text("Next", style: AppStyles.bold15Primary),
      done: const Text("Finish", style: AppStyles.bold15Primary),
      onDone: () async {
        Navigator.pushReplacementNamed(context, AppRoutes.homeRouteName);
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.setBool(SharedPrefsKeys.introScreenKey, false);
        setState(() {});
      },
      nextStyle: TextButton.styleFrom(),
      dotsDecorator: DotsDecorator(
        size: const Size.square(10.0),
        activeSize: const Size(20.0, 10.0),
        activeColor: AppColors.primaryColor,
        color: AppColors.grayColor,
        spacing: const EdgeInsets.symmetric(horizontal: 4.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
      bodyPadding: EdgeInsets.symmetric(
        horizontal: context.width * 0.05,
        vertical: context.height * 0.02,
      ),
    );
  }

  PageViewModel builtPageView(
    String pageImage,
    BuildContext context,
    String firstText,
    String secondText,
  ) {
    return PageViewModel(
      useScrollView: false,
      titleWidget: Image.asset(AppAssets.islamiLogo),
      bodyWidget: Image.asset(pageImage, fit: BoxFit.cover),
      footer: Column(
        spacing: context.height * 0.04,
        children: [
          Text(
            firstText,
            style: AppStyles.bold20Primary,
            textAlign: TextAlign.center,
          ),
          secondText == ''
              ? Container()
              : Text(
                  secondText,
                  style: AppStyles.bold20Primary.copyWith(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
        ],
      ),
      decoration: PageDecoration(
        bodyPadding: EdgeInsets.symmetric(horizontal: context.width * 0.04),
        footerFlex: 0,
        safeArea: context.height * 0.03,
        bodyAlignment: Alignment.center,
      ),
    );
  }
}
