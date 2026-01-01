import 'package:flutter/material.dart';
import 'package:islami1/utils/shared_prefs.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MostRecentProvider extends ChangeNotifier {
  List<int> mostRecentList = [];

  void getMostRecentIndex() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> tempMostRecentList =
        prefs.getStringList(SharedPrefsKeys.mostRecentKey) ?? [];
    debugPrint('get');
    mostRecentList = tempMostRecentList
        .map((element) => int.parse(element))
        .toList();
    notifyListeners();
  }
}
