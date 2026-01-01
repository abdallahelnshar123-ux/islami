import 'package:flutter/material.dart';
import 'package:islami1/home/tabs/quran_tab/model/quran_resources.dart';
import 'package:islami1/utils/provider.dart';
import 'package:provider/provider.dart';

import '../../../../utils/app_assets.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_styles.dart';
import '../../../../utils/screen_size.dart';

class MostRecentWidget extends StatefulWidget {
  @override
  State<MostRecentWidget> createState() => _MostRecentWidgetState();
}

class _MostRecentWidgetState extends State<MostRecentWidget> {
  late MostRecentProvider mostRecentProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      mostRecentProvider.getMostRecentIndex();
    });
  }

  @override
  Widget build(BuildContext context) {
    mostRecentProvider = Provider.of<MostRecentProvider>(context);

    return Visibility(
      visible: mostRecentProvider.mostRecentList.isNotEmpty,
      child: Column(
        spacing: context.height * 0.01,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsGeometry.only(top: context.height * 0.01),
            child: Text('Most Recently', style: AppStyles.bold16White),
          ),

          /// most recent  Widget ========================================
          SizedBox(
            height: context.height * 0.16,
            child: ListView.separated(
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
                            QuranResources.englishQuranSuras[mostRecentProvider
                                .mostRecentList[index]],
                            style: AppStyles.bold24Black,
                          ),
                          Text(
                            QuranResources.arabicQuranSuras[mostRecentProvider
                                .mostRecentList[index]],
                            style: AppStyles.bold24Black,
                          ),
                          Text(
                            '${QuranResources.ayatNumber[mostRecentProvider.mostRecentList[index]]} Verses',
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
              itemCount: mostRecentProvider.mostRecentList.length,
            ),
          ),
        ],
      ),
    );
  }
}
