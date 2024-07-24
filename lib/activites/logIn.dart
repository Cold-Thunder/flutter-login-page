import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_page/activites/createAccount.dart';
import 'package:login_page/widgets/input.dart';
import 'package:login_page/widgets/oneButton.dart';

class Login extends StatefulWidget{
  @override
  _Login createState()=> _Login();
}
class _Login extends State<Login>{
  TextEditingController emailCont = TextEditingController();
  TextEditingController passCont = TextEditingController();

  void forgetPass(){
    print('forget');
  }

  void loginBtn(){
    if(emailCont.text.toString() != '' && passCont.text.toString() != ''){
      print({"${emailCont.text.toString()}", "${passCont.text.toString()}"});
      emailCont.clear();
      passCont.clear();
    }
  }
  void createAccount(){
    Navigator.push(context,
      MaterialPageRoute(builder: (context)=> CreateAccount())
    );
  }

  @override
  Widget build(BuildContext context){
    var wid = MediaQuery.of(context).size.width;
    var hei = MediaQuery.of(context).size.height;
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
          child: Flex(
            direction: Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(20),
                child: const Text('LogIn', style: TextStyle(
                  fontSize: 50,
                  color: Colors.purple,
                  fontWeight: FontWeight.bold
                )),
              ),
              Container(
                  height: 300,
                width: (wid/100)*95,
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(1,1),
                      color: Colors.grey,
                      blurRadius: 10,
                    )
                  ]
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    TextInput(control: emailCont, lab: 'Email', hin: 'Enter Email here...', suffix: false, validator: 'Please enter your email!',),
                    SizedBox(height: 5),
                    TextInput(control: passCont, lab: 'Password', hin: 'Enter password...',suffix: true, validator: 'Please enter your password!'),
                    Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: 20),
                        child: InkWell(
                            onTap: (){
                              forgetPass();
                            },
                            child: const Text('Forget password!', style: TextStyle(fontSize: 18, color: Colors.purple))
                        )
                    ),
                    Container(
                        child: Column(
                          children: [
                            OneButton(func: loginBtn, title: 'Login'),
                            OneButton(func: createAccount, title: 'Create Account')
                          ]
                        )
                    )
                  ]
                )
              )

            ]
          )
        )
      )
    );
  }
}