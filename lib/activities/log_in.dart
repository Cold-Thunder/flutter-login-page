import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider_prac/activities/home_page.dart';
import 'package:provider_prac/widgets/buttons.dart';
import 'package:provider_prac/widgets/textInput.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogIn extends StatefulWidget{
  @override
  LogInState createState()=>LogInState();
}

class LogInState extends State<LogIn>{
  var emailCont = TextEditingController();
  var passCont = TextEditingController();

  static const String LOGIN = 'isLogIn';

  @override
  Widget build(BuildContext context){
    final wid = MediaQuery.of(context).size.width;
    final hei = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: Colors.purple,
        child: Container(
          width: double.infinity,
          height: hei < 1000 ? 400 : 500,
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow:[
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0,1),
                blurRadius: 5,
              )
            ]
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                    radius: 50,
                    child: Icon(Icons.supervised_user_circle, size: 100, color: Colors.purple)
                ),
                TextInput(
                    cont: emailCont,
                    label: 'Email',
                    hint: 'Enter your email..',
                    icon: Icon(Icons.email, size: 25, color: Colors.purple),
                    secure: false,
                ),
                TextInput(
                  cont: passCont,
                  label: 'Password',
                  hint: 'Enter your password..',
                  icon: Icon(Icons.password, size: 25, color: Colors.purple),
                  secure: true
                ),
                SizedBox(height: 10),
                Buttons(name: 'Log In', func: logInFunc, clr: Colors.purple)
              ]
          )
        )
      )
    );
  }
  void logInFunc()async {
    if (emailCont.text.toString() != '' && passCont.text.toString() != '') {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title:const Text('Do you want to stay log in?'),
            titleTextStyle: TextStyle(
                fontSize: 23,
                color: Colors.black
            ),
            actions: [
              TextButton(
                  child: const Text('no', style: TextStyle(fontSize: 22, color: Colors.blue)),
                  onPressed: () {
                    noFunc();
                  }
              ),
              TextButton(
                  child: const Text('Yes', style: TextStyle(fontSize: 22, color: Colors.blue)),
                  onPressed: () {
                    yesFunc();
                  }
              )
            ],
          );
        }
    );
  }else{
      final snack = SnackBar(
          content: const Text('Please provide Email and Password!', style: TextStyle(
            fontSize: 18,
            color: Colors.purple
          )),
        backgroundColor: Colors.white
      );
      ScaffoldMessenger.of(context).showSnackBar(snack);
    }
  }

  void noFunc(){
    Navigator.pop(context);
    if(emailCont.text.toString() != '' && passCont.text.toString() != '') {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => HomePage())
      );
    }
  }
  void yesFunc()async{
    Navigator.pop(context);
    var logData = await SharedPreferences.getInstance();
    if(emailCont.text.toString() != '' && passCont.text.toString() != '') {
      logData.setBool(LOGIN, true);
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => HomePage())
      );
    }
  }
}