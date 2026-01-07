import 'package:flutter/material.dart';

import '../../../../utils/app_assets.dart';
import '../../../../utils/app_styles.dart';
import '../../../../utils/screen_size.dart';

class SebhaWidget extends StatelessWidget {
  VoidCallback opTap;
  double angle;
  String tasbehText;
  int counterText;

  SebhaWidget({
    super.key,
    required this.counterText,
    required this.angle,
    required this.opTap,
    required this.tasbehText,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: opTap,
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
    );
  }
}
