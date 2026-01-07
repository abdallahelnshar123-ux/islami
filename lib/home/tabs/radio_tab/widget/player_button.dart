import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utils/app_assets.dart';
import '../../../../utils/app_colors.dart';

class PlayerButton extends StatelessWidget {
  VoidCallback? onPressed;
  Color splashColor = AppColors.blackColor.withAlpha(40);
  String icon;
  Color highlightColor = AppColors.blackColor.withAlpha(40);
  Color iconColor = AppColors.blackColor;

  PlayerButton({super.key, required this.onPressed, required this.icon});

  PlayerButton.hidden({
    super.key,
    this.highlightColor = AppColors.transparentColor,
    this.splashColor = AppColors.transparentColor,
    this.icon = AppAssets.iconVolumeUnmuted,
    this.iconColor = AppColors.transparentColor,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashColor: splashColor,
      highlightColor: highlightColor,
      padding: EdgeInsets.all(0),
      onPressed: onPressed,
      icon: SvgPicture.asset(
        width: 35,
        icon,
        colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
      ),
    );
  }
}
