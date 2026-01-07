import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami1/home/tabs/hadeth_tab/widget/hadeth_item.dart';
import 'package:islami1/utils/app_routes.dart';
import 'package:islami1/utils/screen_size.dart';

class HadethTab extends StatelessWidget {
  const HadethTab({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: context.height * 0.65,
        enlargeCenterPage: true,
        enableInfiniteScroll: true,
        enlargeFactor: .25,
      ),
      items: List.generate(50, (index) => index + 1).map((index) {
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              AppRoutes.detailsRouteName,
              arguments: [1, index],
            );
          },
          child: HadethItem(index: index),
        );
      }).toList(),
    );
  }
}
