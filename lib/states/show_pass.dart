import 'package:flutter/cupertino.dart';

class ShowPass extends ChangeNotifier{
  bool show =true;

  ShowPass({
    show= true,
  });

  void changeShow(){
    show = !show;
    notifyListeners();
  }
}