import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider_prac/activities/home_page.dart';
import 'package:provider_prac/activities/log_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget{
  @override
  SplashScreenState createState()=> SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>{
  @override
  void initState(){
    super.initState();
    routeFunc();

  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        color: Colors.purple,
        alignment: Alignment.center,
        child:const Text('Login Form', style: TextStyle(
          fontSize: 30,
          color: Colors.white
        ))
      )
    );
  }
  void routeFunc()async{
    var getData = await SharedPreferences.getInstance();
    var logIn = getData.get(LogInState.LOGIN);
    print(logIn);
    if(logIn == true){
      Timer(Duration(seconds: 3), (){
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context)=>HomePage())
        );
      });
    }else{
      Timer(Duration(seconds: 3), (){
        Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context)=>LogIn())
        );
      });
    }
  }
}