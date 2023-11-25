import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier{
  DateTime? date = DateTime.now();
  TimeOfDay? time = TimeOfDay.now();

  void changDate(DateTime d1) {
    date = d1;
    notifyListeners();
  }
  void changeTime(TimeOfDay d2)
  {
    time = d2;
    notifyListeners();
  }

}