import 'package:flutter/material.dart';
import 'package:islami1/utils/app_colors.dart';
import 'package:islami1/utils/app_styles.dart';

class ContentStyle2 extends StatelessWidget {
  String contentLine;
  int index;
  VoidCallback onTap;
  int selectedIndex;

  ContentStyle2({
    super.key,
    required this.contentLine,
    required this.index,
    required this.onTap,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: selectedIndex == index
              ? AppColors.primaryColor
              : AppColors.blackColor,

          borderRadius: BorderRadius.circular(15),
          border: BoxBorder.all(color: AppColors.primaryColor, width: 1.5),
        ),
        width: double.infinity,
        padding: EdgeInsetsGeometry.all(15),
        child: Text(
          '$contentLine [${index + 1}]',
          style: AppStyles.bold15Primary.copyWith(
            fontSize: 17,
            color: selectedIndex == index
                ? AppColors.blackColor
                : AppColors.primaryColor,
          ),
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
