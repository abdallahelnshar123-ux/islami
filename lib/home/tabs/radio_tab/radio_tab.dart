import 'package:flutter/material.dart';
import 'package:islami1/home/tabs/radio_tab/widget/players_list.dart';
import 'package:islami1/utils/app_colors.dart';
import 'package:islami1/utils/screen_size.dart';

class RadioTab extends StatelessWidget {
  RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(

      length: 2,
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(
          horizontal: context.width * 0.046,
        ),
        child: Column(
          spacing: context.height * 0.019,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.black70Color,
              ),
              child: TabBar(


              tabs: [Text('Radio'), Text('Reciters')],
                labelPadding: EdgeInsetsGeometry.symmetric(
                  vertical: context.height * 0.01,
                ),
              ),
            ),
            Expanded(
              child: TabBarView(

                children: [
                  PlayersList(),
                  PlayersList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
