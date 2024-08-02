import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_prac/states/show_pass.dart';

class TextInput extends StatelessWidget{
  late var cont;
  late String label;
  late String hint;
  Icon? icon;
  late bool secure;

  TextInput({
    required this.cont,
    required this.label,
    required this.hint,
    required this.secure,
    this.icon,
  });

  @override
  Widget build(BuildContext context){
    var show = Provider.of<ShowPass>(context, listen: false);
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      margin: EdgeInsets.only(top: 20),
      height: 55,
      child: Consumer<ShowPass>(
        builder: (context, value, child){

        return TextField(
        controller: cont,
        style: TextStyle(
          fontSize: 22,
          color: Colors.purple
        ),
        obscureText: secure == true ? show.show : false,
        obscuringCharacter: '*',
        decoration: InputDecoration(
          labelText: '$label',
          labelStyle: TextStyle(
            fontSize: 22,
            color: Colors.purple
          ),
          hintText: '$hint',
          hintStyle: TextStyle(
            fontSize: 22,
            color: Colors.grey
          ),
          suffixIcon: secure == true? IconButton(
            onPressed: (){
              show.changeShow();
              print(show.show);
            },
            icon: Icon(show.show == false ? Icons.lock : Icons.remove_red_eye, size: 22, color: Colors.purple),
          ): null,
          filled: true,
          fillColor: Colors.white,
          prefixIcon: icon,
          enabledBorder:OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              width: 2,
              color: Colors.purple
            )
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              width: 2,
              color: Colors.purple
            )
          )
        )
      );
        }
      )
    );
  }
}