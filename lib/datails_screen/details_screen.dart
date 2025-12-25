import 'package:flutter/material.dart';
import 'package:islami1/utils/app_assets.dart';
import 'package:islami1/utils/app_colors.dart';
import 'package:islami1/utils/app_styles.dart';
import 'package:islami1/utils/screen_size.dart';

import '../home/tabs/quran_tab/model/quran_resources.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(title: Text(QuranResources.englishQuranSurahs[index])),
      body: Container(
        padding: EdgeInsets.only(
          top: context.height * 0.02,
          bottom: context.height * 0.12,
        ),
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.detailsDecorationImage),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          spacing: context.height * 0.04,
          children: [
            Text(
              QuranResources.arabicQuranSuras[index],
              style: AppStyles.bold24Primary,
            ),
            Expanded(child: Container(color: Colors.blue)),
          ],
        ),
      ),
    );
  }
}
