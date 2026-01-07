import 'package:flutter/material.dart';
import 'package:islami1/home/tabs/radio_tab/widget/player_button.dart';

import '../../../../utils/app_assets.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_styles.dart';
import '../../../../utils/screen_size.dart';

class PlayerWidget extends StatefulWidget {
  const PlayerWidget({super.key});

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
              /// hidden button ===========================================
              PlayerButton.hidden(),

              /// play/pause button ===========================================
              PlayerButton(
                onPressed: () {
                  play = !play;
                  setState(() {});
                },
                icon: play ? AppAssets.iconPause : AppAssets.iconPlay,
              ),

              /// volume button ===========================================
              PlayerButton(
                onPressed: () {
                  volumeOn = !volumeOn;
                  setState(() {});
                },
                icon: volumeOn
                    ? AppAssets.iconVolumeUnmuted
                    : AppAssets.iconVolumeMuted2,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
