import 'package:flutter/material.dart';
import 'package:islami1/utils/app_assets.dart';
import 'package:islami1/utils/app_colors.dart';
import 'package:islami1/utils/screen_size.dart';

class PlayersList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => Container(
        width: double.infinity,
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.primaryColor,
          image: DecorationImage(
            image: AssetImage(AppAssets.radioDecor),
            fit: BoxFit.fitWidth,
            alignment: Alignment.bottomCenter,
          ),
        ),
      ),
      separatorBuilder: (context, index) =>
          SizedBox(height: context.height * 0.017),
      itemCount: 10,
    );
  }
}
