import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami1/home/tabs/quran_tab/model/quran_resources.dart';
import 'package:islami1/home/tabs/quran_tab/model/sura_data.dart';
import 'package:islami1/home/tabs/quran_tab/widget/sura_item.dart';
import 'package:islami1/utils/app_assets.dart';
import 'package:islami1/utils/app_colors.dart';
import 'package:islami1/utils/app_styles.dart';
import 'package:islami1/utils/screen_size.dart';

import '../../../utils/app_routes.dart';

class QuranTab extends StatefulWidget {
  QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  List<SuraData> suraDataList = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.width * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: context.height * 0.01,
        children: [
          /// search text field ==================================
          TextField(
            cursorColor: AppColors.primaryColor,
            style: AppStyles.bold16White,
            decoration: InputDecoration(
              contentPadding: EdgeInsetsGeometry.symmetric(vertical: 13),
              hintText: 'Sura Name',
              hintStyle: AppStyles.bold16White,
              prefixIcon: Padding(
                padding: const EdgeInsets.all(10),
                child: SvgPicture.asset(
                  width: 28,
                  AppAssets.iconSearch,
                  colorFilter: ColorFilter.mode(
                    AppColors.primaryColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              enabledBorder: builtDecorationBorder(),
              focusedBorder: builtDecorationBorder(),
            ),
          ),

          /// most recently Text ==================================
          Padding(
            padding: EdgeInsetsGeometry.only(top: context.height * 0.01),
            child: Text('Most Recently', style: AppStyles.bold16White),
          ),

          /// most recent  Widget ========================================
          SizedBox(
            height: context.height * 0.16,
            child: suraDataList.isEmpty
                ? Container(
                    width: double.infinity,
                    padding: EdgeInsetsGeometry.symmetric(
                      horizontal: context.width * 0.04,
                      vertical: context.height * 0.01,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'No\nRecent\nRecord',
                          style: AppStyles.bold24Black.copyWith(fontSize: 20),
                        ),
                        Image.asset(AppAssets.mostRecentImage),
                      ],
                    ),
                  )
                : ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsetsGeometry.symmetric(
                          horizontal: context.width * 0.04,
                          vertical: context.height * 0.01,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  suraDataList[index].englishName,
                                  style: AppStyles.bold24Black,
                                ),
                                Text(
                                  suraDataList[index].arabicName,
                                  style: AppStyles.bold24Black,
                                ),
                                Text(
                                  suraDataList[index].ayatNumber,
                                  style: AppStyles.bold14Black,
                                ),
                              ],
                            ),
                            Image.asset(AppAssets.mostRecentImage),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(width: context.width * 0.04);
                    },
                    itemCount: suraDataList.length,
                  ),
          ),

          /// suras list Text ===========================================
          Text('Suras List', style: AppStyles.bold16White),

          /// suras items Widget ========================================
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return SuraItemWidget(
                  index: index,
                  onTap: () {
                    suraDataList.insert(
                      0,
                      SuraData(
                        arabicName: QuranResources.arabicQuranSuras[index],
                        englishName: QuranResources.englishQuranSurahs[index],
                        ayatNumber: QuranResources.ayatNumber[index],
                      ),
                    );

                    Navigator.pushNamed(
                      context,
                      AppRoutes.detailsRouteName,
                      arguments: index,
                    );
                    setState(() {});
                  },
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  height: 1,
                  color: AppColors.whiteColor,
                  indent: context.width * 0.1,
                  endIndent: context.width * 0.1,
                );
              },
              itemCount: 114,
            ),
          ),
        ],
      ),
    );
  }

  OutlineInputBorder builtDecorationBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(width: 2, color: AppColors.primaryColor),
    );
  }
}
