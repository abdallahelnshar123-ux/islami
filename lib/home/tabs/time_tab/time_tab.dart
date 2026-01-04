import 'package:flutter/material.dart';
import 'package:islami1/home/tabs/time_tab/widget/azkar_widget.dart';
import 'package:islami1/home/tabs/time_tab/widget/time_widget.dart';
import 'package:islami1/utils/app_assets.dart';
import 'package:islami1/utils/app_styles.dart';
import 'package:islami1/utils/screen_size.dart';

class TimeTab extends StatelessWidget {
  TimeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsetsGeometry.symmetric(
        horizontal: context.width * 0.035,
        vertical: context.width * 0.035,
      ),
      children: [
        TimeWidget(),
        Padding(
          padding: EdgeInsets.symmetric(vertical: context.height * 0.025),
          child: Text('Azkar', style: AppStyles.bold16White),
        ),
        Column(
          spacing: context.width * 0.048,
          children: [
            Row(
              spacing: context.width * 0.048,
              children: [
                AzkarWidget(
                  image: AppAssets.eveningAzkarImg,
                  text: 'Evening Azkar',
                ),
                AzkarWidget(
                  image: AppAssets.morningAzkarImg,
                  text: 'Morning Azkar',
                ),
              ],
            ),
            Row(
              spacing: context.width * 0.048,
              children: [
                AzkarWidget(
                  image: AppAssets.wakingAzkarImg,
                  text: 'Waking Azkar',
                ),
                AzkarWidget(
                  image: AppAssets.sleepingAzkarImg,
                  text: 'Sleeping Azkar',
                ),
              ],
            ),
          ],
        ),
      ],
    );

    /*
      Column(
        spacing: context.height*0.025,
        crossAxisAlignment:CrossAxisAlignment.start,
        children: [
          /// time widget ======================================================
          TimeWidget(),

          Text('Azkar',style: AppStyles.bold16White,),
          Expanded(
            child: GridView.builder(

              itemCount: 4,
              itemBuilder: (context, index) => AzkarWidget(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(

                crossAxisSpacing: context.width*0.048,
                mainAxisSpacing: context.width*0.048,
                crossAxisCount: 2,
                childAspectRatio: 2 / 3,
              ),
            ),
          ),
        ],
      ),

       */
  }
}
