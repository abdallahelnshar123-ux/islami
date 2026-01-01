import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami1/datails_screen/widget/content_style_1.dart';
import 'package:islami1/datails_screen/widget/content_style_2.dart';
import 'package:islami1/utils/app_assets.dart';
import 'package:islami1/utils/app_colors.dart';
import 'package:islami1/utils/app_styles.dart';
import 'package:islami1/utils/screen_size.dart';
import 'package:provider/provider.dart';

import '../home/tabs/hadeth_tab/model/hadeth_data.dart';
import '../home/tabs/quran_tab/model/quran_resources.dart';
import '../utils/provider.dart';

class DetailsScreen extends StatefulWidget {
  DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late MostRecentProvider mostRecentProvider;
  bool isLoaded = false;
  List<String> suraVerses = [];
  int style = 1;

  // bool style1 = true;
  // bool style2 = false;
  int selectedIndex = -1;
  Hadeth? hadeth;
  late int hadethIndex;
  late List<int> indexList;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    mostRecentProvider.getMostRecentIndex();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (isLoaded) return;
    indexList = ModalRoute.of(context)!.settings.arguments as List<int>;
    if (indexList[0] == 0) {
      loadSuraFiles(indexList[1]);
    } else {
      loadHadethFiles(indexList[1]);
    }
  }

  @override
  Widget build(BuildContext context) {
    mostRecentProvider = Provider.of<MostRecentProvider>(context);
    int suraIndex;
    if (indexList[0] == 0) {
      suraIndex = indexList[1];
      hadethIndex = 1;
    } else {
      hadethIndex = indexList[1];
      suraIndex = 1;
    }

    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        actionsPadding: EdgeInsetsGeometry.only(right: context.width * 0.05),

        title: Text(
          indexList[0] == 0
              ? QuranResources.englishQuranSuras[suraIndex]
              : 'Hadeth $hadethIndex',
        ),
        actions: [
          Visibility(
            visible: indexList[0] == 0,
            child: TextButton(
              style: TextButton.styleFrom(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                minimumSize: Size.zero,
                padding: EdgeInsetsGeometry.symmetric(horizontal: 15),
                backgroundColor: style == 1
                    ? AppColors.primaryColor
                    : AppColors.blackColor,
              ),
              onPressed: () {
                style = 1;
                // style1 = true;
                // style2 = false;
                setState(() {});
              },
              child: Text(
                '1',
                style: AppStyles.bold16White.copyWith(
                  color: style == 1
                      ? AppColors.blackColor
                      : AppColors.primaryColor,
                ),
              ),
            ),
          ),
          Visibility(
            visible: indexList[0] == 0,
            child: TextButton(
              style: TextButton.styleFrom(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                minimumSize: Size.zero,
                padding: EdgeInsetsGeometry.symmetric(horizontal: 15),
                backgroundColor: style == 2
                    ? AppColors.primaryColor
                    : AppColors.blackColor,
              ),
              onPressed: () {
                style = 2;
                // style1 = false;
                // style2 = true;
                setState(() {});
              },
              child: Text(
                '2',
                style: AppStyles.bold16White.copyWith(
                  color: style == 2
                      ? AppColors.blackColor
                      : AppColors.primaryColor,
                ),
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: context.width * 0.15),
              child: Text(
                textAlign: TextAlign.center,
                indexList[0] == 0
                    ? QuranResources.arabicQuranSuras[suraIndex]
                    : hadeth?.title ?? '',
                style: AppStyles.bold24Primary,
              ),
            ),
            Expanded(
              child: !isLoaded
                  ? Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
                    )
                  : ListView.separated(
                      padding: EdgeInsetsGeometry.all(context.width * 0.05),
                      itemBuilder: (context, index) => style == 1
                          ? ContentStyle1(
                              contentList: indexList[0] == 0
                                  ? suraVerses
                                  : [hadeth!.content],
                            )
                          : ContentStyle2(
                              onTap: () {
                                selectedIndex = selectedIndex == index
                                    ? -1
                                    : index;

                                setState(() {});
                              },
                              selectedIndex: selectedIndex,
                              contentLine: suraVerses.isEmpty
                                  ? ''
                                  : suraVerses[index],
                              index: index,
                            ),
                      separatorBuilder: (context, index) =>
                          SizedBox(height: style == 1 ? 0 : 10),
                      itemCount: indexList[0] == 0
                          ? style == 1
                                ? 1
                                : suraVerses.length
                          : 1,
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

    setState(() {
      isLoaded = true;
    });
    debugPrint('test1');
  }

  void loadHadethFiles(int index) async {
    String fileContent = await rootBundle.loadString(
      'assets/hadeeth/h$index.txt',
    );
    String title = fileContent.substring(0, fileContent.indexOf('\n'));
    String content = fileContent.substring(fileContent.indexOf('\n') + 1);
    hadeth = Hadeth(title: title, content: content);
    setState(() {
      isLoaded = true;
    });
    debugPrint('test2');
  }
}
