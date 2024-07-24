import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OneButton extends StatelessWidget{
  Function func;
  String title;

  OneButton({
    required this.func,
    required this.title,
    super.key
  });
  @override
  Widget build(BuildContext context){
    return ElevatedButton(
        onPressed: (){
           func();
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.purple,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
            )
        ),
        child: Text('$title', style: TextStyle(
          fontSize: 22,
          color: Colors.white,
        ))
    );
  }
}
