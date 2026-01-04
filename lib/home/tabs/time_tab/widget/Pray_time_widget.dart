import 'package:flutter/material.dart';
import 'package:islami1/home/tabs/time_tab/model/pray.dart';
import 'package:islami1/utils/app_colors.dart';
import 'package:islami1/utils/app_styles.dart';

class PrayTimeWidget extends StatelessWidget {
  final int index;

  PrayTimeWidget({super.key, required this.index});

  final List<Pray> prayList = [
    Pray(name: 'Sunrise', time: '01:04', timePeriod: 'PM'),
    Pray(name: 'Dhuhr', time: '01:01', timePeriod: 'PM'),
    Pray(name: 'ASR', time: '04:38', timePeriod: 'PM'),
    Pray(name: 'Maghrib', time: '07:57', timePeriod: 'PM'),
    Pray(name: 'Isha', time: '09:57', timePeriod: 'PM'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [AppColors.brownColor, AppColors.primaryColor],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          textBuilder(
            prayList[index].name,
            AppStyles.bold14Black.copyWith(color: AppColors.whiteColor),
          ),
          textBuilder(
            prayList[index].time,
            AppStyles.bold20White.copyWith(fontSize: 25),
          ),
          textBuilder(prayList[index].timePeriod, AppStyles.bold16White),
        ],
      ),
    );
  }

  Widget textBuilder(String text, TextStyle style) {
    return Expanded(
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(text, style: style),
      ),
    );
  }
}
