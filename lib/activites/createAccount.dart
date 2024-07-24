import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateAccount extends StatefulWidget{
  @override
  _CreateAccount createState()=> _CreateAccount();
}
class _CreateAccount extends State<CreateAccount>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: const Text('Create Account', style:
            TextStyle(
              fontSize: 24,
              color: Colors.white,
            )
          ),
          backgroundColor: Colors.green,
          iconTheme: const IconThemeData(
            color: Colors.white
          )
        ),
        body: SafeArea(
          child: Center(
            child: Column(

            )
          )
        )
    );
  }
}