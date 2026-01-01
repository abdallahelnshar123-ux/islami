import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami1/home/tabs/quran_tab/model/quran_resources.dart';
import 'package:islami1/home/tabs/quran_tab/model/sura_data.dart';
import 'package:islami1/home/tabs/quran_tab/widget/most_recent_widget.dart';
import 'package:islami1/home/tabs/quran_tab/widget/sura_item.dart';
import 'package:islami1/utils/app_assets.dart';
import 'package:islami1/utils/app_colors.dart';
import 'package:islami1/utils/app_styles.dart';
import 'package:islami1/utils/screen_size.dart';
import 'package:islami1/utils/shared_prefs.dart';

import '../../../utils/app_routes.dart';

class QuranTab extends StatefulWidget {
  QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  List<int> filterList = List.generate(114, (index) => index);
  List<SuraData> suraDataList = [];
  bool searching = false;

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
            autofocus: false,
            onChanged: (text) {
              searchByNewText(text);
            },
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

          /// most recently widget==================================
          Visibility(visible: searching == false, child: MostRecentWidget()),

          /// suras list Text ===========================================
          Text('Suras List', style: AppStyles.bold16White),

          /// suras items Widget ========================================
          Expanded(
            child: filterList.isEmpty
                ? Center(
                    child: Text(
                      'No Sura Item Found !',
                      style: AppStyles.bold20Primary,
                    ),
                  )
                : ListView.separated(
                    itemBuilder: (context, index) {
                return SuraItemWidget(
                        index: filterList[index],
                        onTap: () {
                          saveLastSuraIndex(filterList[index]);
                          Navigator.pushNamed(
                      context,
                      AppRoutes.detailsRouteName,
                            arguments: [0, filterList[index]],
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
                    itemCount: filterList.length,
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

  void searchByNewText(String text) {
    List<int> searchResultList = [];
    for (int i = 0; i < QuranResources.arabicQuranSuras.length; i++) {
      if (QuranResources.arabicQuranSuras[i].contains(text)) {
        searchResultList.add(i);
      }
    }
    for (int i = 0; i < QuranResources.englishQuranSuras.length; i++) {
      if (QuranResources.englishQuranSuras[i].toLowerCase().contains(
        text.toLowerCase().trim(),
      )) {
        searchResultList.add(i);
      }
    }
    searching = text.isNotEmpty;
    filterList = searchResultList;
    setState(() {});
  }
}
