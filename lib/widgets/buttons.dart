import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Buttons extends StatelessWidget{

  late String name;
  late Function func;
  late Color clr;

  Buttons({
    required this.name,
    required this.func,
    required this.clr
  });

  @override
  Widget build(BuildContext context){
    return ElevatedButton(
        onPressed: (){
          func();
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: clr
        ),
        child: Text('$name', style: TextStyle(
          fontSize: 22,
          color: Colors.white
        ))
    );
  }
}