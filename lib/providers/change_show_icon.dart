import 'package:flutter/cupertino.dart';

class ChangeShowIcon extends ChangeNotifier{
  bool show;

  ChangeShowIcon({
    this.show = true
  });
  void change(){
    show = !show;
    notifyListeners();
  }
}