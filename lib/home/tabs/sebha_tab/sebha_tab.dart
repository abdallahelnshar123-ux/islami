import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:islami1/utils/app_assets.dart';
import 'package:islami1/utils/app_styles.dart';
import 'package:islami1/utils/screen_size.dart';

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
          'سَبِّحِ اسْمَ رَبِّكَ الأعلى ',
          textDirection: TextDirection.rtl,
          style: AppStyles.bold32White,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 30),
        Expanded(
          child: GestureDetector(
            onTap: rotateImage,
            child: Padding(
              padding: EdgeInsets.all(0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Transform.rotate(
                    angle: angle,
                    child: Image.asset(AppAssets.sebhaImage),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: context.height * 0.04,
                    children: [
                      // SizedBox(height: context.height * 0.09),
                      Text(
                        tasbehText,
                        style: AppStyles.bold32White,
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.center,
                      ),
                      Text('$counterText', style: AppStyles.bold32White),
                    ],
                  ),
                ],
              ),
            ),
          ),
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

    // if (counter < 99) {
    //   if (counter >= 0 && counter <= 32) {
    //     counterText <= 32 ? counterText++ : counterText = 0;
    //     tasbehText = 'سبحان الله';
    //   } else if (counter >= 33 && counter <= 66) {
    //     counterText <= 32 ? counterText++ : counterText = 0;
    //     tasbehText = 'الحمد لله';
    //   } else if (counter >= 66) {
    //     counterText <= 32 ? counterText++ : counterText = 0;
    //     tasbehText = 'الله أكبر';
    //   }
    //   angle += 10.9090909091 * math.pi / 180;
    //   // counter <33 ? counter++ : counter=0;
    //
    //   counter++;
    // } else {
    //   angle = 0;
    //   counter = 0;
    //   tasbehText = 'سبحان الله';
    // }

    setState(() {});
  }
}
