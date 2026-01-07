import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami1/home/tabs/hadeth_tab/hadeth_tab.dart';
import 'package:islami1/home/tabs/quran_tab/quran_tab.dart';
import 'package:islami1/home/tabs/radio_tab/radio_tab.dart';
import 'package:islami1/home/tabs/sebha_tab/sebha_tab.dart';
import 'package:islami1/home/tabs/time_tab/time_tab.dart';
import 'package:islami1/utils/app_assets.dart';
import 'package:islami1/utils/app_colors.dart';

import '../utils/screen_size.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  /// tabs background images list ============================================
  List<String> backGroundImages = [
    AppAssets.quranBG,
    AppAssets.hadethBG,
    AppAssets.sebhaBG,
    AppAssets.radioBG,
    AppAssets.timeBG,
  ];

  /// tabs widgets list ============================================
  List<Widget> tabsList = [
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab(),
  ];

  @override
  Widget build(BuildContext context) {
    /// app home screen body ===============================================
    return Stack(
      children: [
        /// tabs background images ==========================================
        Image.asset(
          backGroundImages[selectedIndex],
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        Scaffold(
          bottomNavigationBar: Theme(
            data: Theme.of(
              context,
            ).copyWith(canvasColor: AppColors.primaryColor),
            child: BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: (index) {
                selectedIndex = index;
                setState(() {});
              },

              /// navigation bar icons =====================================
              items: [
                builtBottomNavigationBarItem(
                  label: 'Quran',
                  iconName: AppAssets.iconQuran,
                  index: 0,
                ),
                builtBottomNavigationBarItem(
                  label: 'Hadeth',
                  iconName: AppAssets.iconHadeth,
                  index: 1,
                ),
                builtBottomNavigationBarItem(
                  label: 'Sebha',
                  iconName: AppAssets.iconSepha,
                  index: 2,
                ),
                builtBottomNavigationBarItem(
                  label: 'Radio',
                  iconName: AppAssets.iconRadio,
                  index: 3,
                ),
                builtBottomNavigationBarItem(
                  label: 'Time',
                  iconName: AppAssets.iconTime,
                  index: 4,
                ),
              ],
            ),
          ),

          /// body contains islami logo static , tabs changes by taping bottom navigation bar
          body: SafeArea(
            child: Column(
              spacing: context.height * 0.01,
              children: [
                Image.asset(AppAssets.islamiLogo),
                Expanded(child: tabsList[selectedIndex]),
              ],
            ),
          ),
        ),
      ],
    );
  }

  BottomNavigationBarItem builtBottomNavigationBarItem({
    required String label,
    required String iconName,
    required int index,
  }) {
    return BottomNavigationBarItem(
      icon: index == selectedIndex
          ? Container(
              padding: EdgeInsetsGeometry.symmetric(
                vertical: 6,
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                color: AppColors.blackBgColor,
                borderRadius: BorderRadius.circular(66),
              ),
              child: SvgPicture.asset(
                iconName,
                colorFilter: ColorFilter.mode(
                  index == selectedIndex
                      ? AppColors.whiteColor
                      : AppColors.blackColor,
                  BlendMode.srcIn,
                ),
                width: 20,
              ),
            )
          : SvgPicture.asset(
              iconName,
              colorFilter: ColorFilter.mode(
                index == selectedIndex
                    ? AppColors.whiteColor
                    : AppColors.blackColor,
                BlendMode.srcIn,
              ),
              width: 20,
            ),
      label: label,
    );
  }
}
