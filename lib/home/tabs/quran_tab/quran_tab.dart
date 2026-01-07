import 'package:flutter/material.dart';
import 'package:islami1/home/tabs/quran_tab/model/quran_resources.dart';
import 'package:islami1/home/tabs/quran_tab/widget/most_recent_widget.dart';
import 'package:islami1/home/tabs/quran_tab/widget/search_text_field.dart';
import 'package:islami1/home/tabs/quran_tab/widget/sura_item.dart';
import 'package:islami1/utils/app_colors.dart';
import 'package:islami1/utils/app_styles.dart';
import 'package:islami1/utils/screen_size.dart';
import 'package:islami1/utils/shared_prefs.dart';

import '../../../utils/app_routes.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  List<int> filterList = List.generate(114, (index) => index);
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
          SearchTextField(searchFunction: searchByNewText),

          /// most recently widget==================================
          MostRecentWidget(searching: searching),

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

  /// search function =======================================================
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
