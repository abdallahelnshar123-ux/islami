import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami1/utils/app_assets.dart';
import 'package:islami1/utils/app_colors.dart';
import 'package:islami1/utils/app_styles.dart';
import 'package:islami1/utils/screen_size.dart';

import '../model/quran_resources.dart';

class SuraItemWidget extends StatelessWidget {
  int index;
  GestureTapCallback onTap;

  SuraItemWidget({super.key, required this.index, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      horizontalTitleGap: context.width * 0.046,
      minVerticalPadding: 12,
      contentPadding: EdgeInsetsGeometry.zero,
      leading: Stack(
        alignment: Alignment.center,
        children: [
          SvgPicture.asset(
            width: 60,
            AppAssets.iconSuraNumber,
            colorFilter: ColorFilter.mode(
              AppColors.whiteColor,
              BlendMode.srcIn,
            ),
          ),
          Text("${index + 1}", style: AppStyles.bold16White),
        ],
      ),
      title: Text(
        QuranResources.englishQuranSurahs[index],
        style: AppStyles.bold20White,
      ),
      subtitle: Text(
        QuranResources.ayatNumber[index],
        style: AppStyles.bold14Black.copyWith(color: AppColors.whiteColor),
      ),
      trailing: Text(
        QuranResources.arabicQuranSuras[index],
        style: AppStyles.bold20White,
      ),
    );
  }
}
