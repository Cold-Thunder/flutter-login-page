import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_page/widgets/input.dart';

class Login extends StatefulWidget{
  @override
  _Login createState()=> _Login();
}
class _Login extends State<Login>{
  TextEditingController emailCont = TextEditingController();
  TextEditingController passCont = TextEditingController();
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login', style: TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.bold
        )),
        backgroundColor: Colors.purple,
        iconTheme: const IconThemeData(
          color: Colors.white
        )
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              TextInput(control: emailCont, lab: 'Email', hin: 'Enter Email here...', suffix: false),
              SizedBox(height: 15),
              TextInput(control: passCont, lab: 'Password', hin: 'Enter password...',suffix: true)
            ]
          )
        )
      )
    );
  }
}