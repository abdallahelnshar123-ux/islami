import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami1/utils/app_assets.dart';
import 'package:islami1/utils/app_colors.dart';
import 'package:islami1/utils/app_styles.dart';
import 'package:islami1/utils/screen_size.dart';

import '../model/hadeth_data.dart';

class HadethItem extends StatefulWidget {
  final int index;

  const HadethItem({super.key, required this.index});

  @override
  State<HadethItem> createState() => _HadethItemState();
}

class _HadethItemState extends State<HadethItem> {
  Hadeth? hadeth;

  @override
  void initState() {
    super.initState();
    loadHadethFiles();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.hadethDecorImage),
          fit: BoxFit.fill,
        ),
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: hadeth == null
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: EdgeInsets.fromLTRB(
                context.width * 0.03,
                context.height * 0.04,
                context.width * 0.03,
                context.height * 0.1,
              ),
              child: Column(
                spacing: context.height * 0.04,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: context.width * 0.04,
                    ),
                    child: Text(
                      hadeth?.title ?? '',
                      style: AppStyles.bold24Black,
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.rtl,
                        hadeth?.content ?? '',
                        style: AppStyles.bold16White.copyWith(
                          color: AppColors.blackColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  /// load hadeth data function ==============================================
  void loadHadethFiles() async {
    String fileContent = await rootBundle.loadString(
      'assets/hadeeth/h${widget.index}.txt',
    );
    String title = fileContent.substring(0, fileContent.indexOf('\n'));
    String content = fileContent.substring(fileContent.indexOf('\n') + 1);
    hadeth = Hadeth(title: title, content: content);
    setState(() {});
  }
}
