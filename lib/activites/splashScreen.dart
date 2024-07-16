import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_page/activites/logIn.dart';

class Splashscreen extends StatefulWidget{
  @override
  _Splashscreen createState()=> _Splashscreen();
}
class _Splashscreen extends State<Splashscreen>{

  void initState(){
    super.initState();
    Timer(Duration(seconds: 3), (){
      Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context)=>Login())
      );
    });
  }
  @override
  Widget build(BuildContext context){
    var wid= MediaQuery.of(context).size.width;
    var hei = MediaQuery.of(context).size.height;
    return Center(
      child: Container(
        width: wid,
        height: hei,
        alignment: Alignment.center,
        color: Colors.purple,
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Practice',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                )
              )
            ]
          )
        )
      )
    );
  }
}