import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider_prac/activities/log_in.dart';
import 'package:provider_prac/widgets/buttons.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget{
  @override
  _HomePage createState()=> _HomePage();
}

class _HomePage extends State<HomePage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home', style: TextStyle(
            fontSize: 22,
            color: Colors.white
        )),
        backgroundColor: Colors.purple,
        leading: const Icon(Icons.home, size:40, color: Colors.white),
      ),
      body:SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               CircleAvatar(
                 radius: 70,
                   child: const Icon(Icons.supervised_user_circle, size: 120, color: Colors.purple)
               ),
              Container(
                child: Buttons(name: 'Log out', func: logOut, clr: Colors.purple )
              )
            ]
          )
        )
      )
    );
  }
  void logOut()async{
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context)=> LogIn())
    );
    var logIn = await SharedPreferences.getInstance();
    logIn.setBool(LogInState.LOGIN, false);
  }
}