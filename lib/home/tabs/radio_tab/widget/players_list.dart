import 'package:flutter/material.dart';
import 'package:islami1/home/tabs/radio_tab/widget/player_widget.dart';
import 'package:islami1/utils/screen_size.dart';

class PlayersList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => PlayerWidget(),
      separatorBuilder: (context, index) =>
          SizedBox(height: context.height * 0.017),
      itemCount: 10,
    );
  }
}
