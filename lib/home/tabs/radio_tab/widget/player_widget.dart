import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utils/app_assets.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_styles.dart';
import '../../../../utils/screen_size.dart';

class PlayerWidget extends StatefulWidget {
  @override
  State<PlayerWidget> createState() => _PlayerWidgetState();
}

class _PlayerWidgetState extends State<PlayerWidget> {
  bool play = false;

  bool volumeOn = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      width: double.infinity,
      height: 170,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.primaryColor,
        image: DecorationImage(
          image: AssetImage(play ? AppAssets.soundWave : AppAssets.radioDecor),
          fit: BoxFit.fitWidth,
          alignment: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Ibrahim Al-Akdar', style: AppStyles.bold20Black),
          Row(
            spacing: context.width * 0.03,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                splashColor: AppColors.transparentColor,
                highlightColor: AppColors.transparentColor,
                padding: EdgeInsets.all(0),
                onPressed: () {},
                icon: SvgPicture.asset(
                  AppAssets.iconVolumeUnmuted,
                  colorFilter: ColorFilter.mode(
                    AppColors.transparentColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              IconButton(
                padding: EdgeInsets.all(0),
                onPressed: () {
                  play = !play;
                  setState(() {});
                },
                icon: SvgPicture.asset(
                  width: 35,
                  play ? AppAssets.iconPause : AppAssets.iconPlay,
                  colorFilter: ColorFilter.mode(
                    AppColors.blackColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              IconButton(
                padding: EdgeInsets.all(0),
                onPressed: () {
                  volumeOn = !volumeOn;
                  setState(() {});
                },
                icon: SvgPicture.asset(
                  width: 35,
                  volumeOn
                      ? AppAssets.iconVolumeUnmuted
                      : AppAssets.iconVolumeMuted2,
                  colorFilter: ColorFilter.mode(
                    AppColors.blackColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
