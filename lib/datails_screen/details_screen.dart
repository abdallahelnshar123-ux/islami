import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami1/datails_screen/widget/content_style_1.dart';
import 'package:islami1/datails_screen/widget/content_style_2.dart';
import 'package:islami1/utils/app_assets.dart';
import 'package:islami1/utils/app_colors.dart';
import 'package:islami1/utils/app_styles.dart';
import 'package:islami1/utils/screen_size.dart';

import '../home/tabs/quran_tab/model/quran_resources.dart';

class DetailsScreen extends StatefulWidget {
  DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  List<String> suraVerses = [];
  bool style1 = true;
  bool style2 = false;
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)!.settings.arguments as int;
    if (suraVerses.isEmpty) loadSuraFiles(index);
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        actionsPadding: EdgeInsetsGeometry.only(right: context.width * 0.05),

        title: Text(QuranResources.englishQuranSurahs[index]),
        actions: [
          TextButton(
            style: TextButton.styleFrom(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              minimumSize: Size.zero,
              padding: EdgeInsetsGeometry.symmetric(horizontal: 15),
              backgroundColor: style1
                  ? AppColors.primaryColor
                  : AppColors.blackColor,
            ),
            onPressed: () {
              style1 = true;
              style2 = false;
              setState(() {});
            },
            child: Text(
              '1',
              style: AppStyles.bold16White.copyWith(
                color: style1 ? AppColors.blackColor : AppColors.primaryColor,
              ),
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              minimumSize: Size.zero,
              padding: EdgeInsetsGeometry.symmetric(horizontal: 15),
              backgroundColor: style2
                  ? AppColors.primaryColor
                  : AppColors.blackColor,
            ),
            onPressed: () {
              style1 = false;
              style2 = true;
              setState(() {});
            },
            child: Text(
              '2',
              style: AppStyles.bold16White.copyWith(
                color: style2 ? AppColors.blackColor : AppColors.primaryColor,
              ),
            ),
          ),
        ],
      ),
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
            Expanded(
              child: suraVerses.isEmpty
                  ? Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
                    )
                  : ListView.separated(
                      padding: EdgeInsetsGeometry.all(context.width * 0.05),
                      itemBuilder: (context, index) => style1
                          ? ContentStyle1(contentList: suraVerses)
                          : ContentStyle2(
                              onTap: () {
                                if (selectedIndex == index) {
                                  selectedIndex = -1;
                                } else {
                                  selectedIndex = index;
                                }
                                setState(() {});
                              },
                              selectedIndex: selectedIndex,
                              contentLine: suraVerses[index],
                              index: index,
                            ),
                      separatorBuilder: (context, index) =>
                          SizedBox(height: style1 ? 0 : 10),
                      itemCount: style1 ? 1 : suraVerses.length,
                    ),
            ),
          ],
        ),
      ),
    );
  }

  void loadSuraFiles(int index) async {
    String fileContent = await rootBundle.loadString(
      'assets/suras/${index + 1}.txt',
    );
    List<String> contentLines = fileContent.split('\n');
    suraVerses = contentLines;

    setState(() {});
  }
}
