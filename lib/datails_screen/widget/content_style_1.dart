import 'package:flutter/material.dart';
import 'package:islami1/utils/app_styles.dart';

class ContentStyle1 extends StatelessWidget {
  final List<String> contentList;

  ContentStyle1({super.key, required this.contentList});

  @override
  Widget build(BuildContext context) {
    return Text(
      joinContent(contentList),
      style: AppStyles.bold15Primary.copyWith(height: 2.1, fontSize: 17),
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.center,
    );
  }

  String joinContent(List<String> suraVerses) {
    List<String> tempList = [];
    if (suraVerses.length == 1) return suraVerses[0];
    for (int i = 0; i < suraVerses.length; i++) {
      tempList.add('${suraVerses[i]} [${i + 1}]');
    }
    String content = tempList.join('  ');
    return content;
  }
}
