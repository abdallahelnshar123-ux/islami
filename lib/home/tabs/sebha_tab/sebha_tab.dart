import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:islami1/home/tabs/sebha_tab/widget/sebha_widget.dart';
import 'package:islami1/utils/app_styles.dart';

class SebhaTab extends StatefulWidget {
  SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  int counterText = 0;
  String tasbehText = 'سبحان الله';
  double angle = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      // spacing: context.height*0.05,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: 7),
        Text(
          'سَبِّحِ اسْمَ رَبِّكَ الأعلى',
          textDirection: TextDirection.rtl,
          style: AppStyles.bold32White,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 30),
        SebhaWidget(
          counterText: counterText,
          angle: angle,
          opTap: rotateImage,
          tasbehText: tasbehText,
        ),
      ],
    );
  }

  void rotateImage() {
    if (counterText <= 32) {
      counterText++;
      angle += 10.9090909091 * math.pi / 180;
    } else {
      counterText = 0;
      counter++;
      angle = 0;
    }

    switch (counter) {
      case 1:
        tasbehText = 'سبحان الله';
        break;
      case 2:
        tasbehText = 'الحمد لله';
        break;
      case 3:
        tasbehText = 'الله أكبر';
        break;
      default:
        counter = 1;
        tasbehText = 'سبحان الله';
        break;
    }
    setState(() {});
  }
}
