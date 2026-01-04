import 'package:flutter/material.dart';
import 'package:islami1/utils/app_colors.dart';
import 'package:islami1/utils/app_styles.dart';

class AzkarWidget extends StatelessWidget {
  String image;
  String text;

  AzkarWidget({super.key, required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.blackColor,
          border: BoxBorder.all(width: 2, color: AppColors.primaryColor),
        ),
        child: Column(
          spacing: 20,
          children: [
            Image.asset(image),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(text, style: AppStyles.bold20White),
            ),
          ],
        ),
      ),
    );
  }
}
