import 'package:flutter/material.dart';
import 'package:login_page/providers/change_show_icon.dart';
import 'package:provider/provider.dart';

class TextInput extends StatelessWidget {
  TextEditingController control = TextEditingController();
  String lab = "";
  String hin = "";
  bool suffix;
  bool show = false;
  String validator = '';

  TextInput({
    required this.control,
    required this.lab,
    required this.hin,
    required this.suffix,
    required this.validator,
    super.key
  });

  @override
  void initState() {
    show = suffix;
  }

  @override
  Widget build(BuildContext context) {
    var iconChange = Provider.of<ChangeShowIcon>(context, listen: false);

    return Consumer<ChangeShowIcon>(
        builder: (context, value, child) {
          return Container(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
              height: 70,
              child: TextFormField(
                  controller: control,
                  obscureText: suffix == true ? iconChange.show : suffix,
                  obscuringCharacter: '*',
                  style: const TextStyle(
                      fontSize: 19,
                      color: Colors.black
                  ),
                  validator: (value){
                    if(value == ''){
                      return validator;
                    }
                  },
                  autofocus: false,
                  decoration: InputDecoration(
                    filled: true,
                      fillColor: Colors.white,
                      labelText: "$lab",
                      labelStyle: const TextStyle(
                        fontSize: 22, color: Colors.purple,
                      ),
                      hintText: '$hin',
                      hintStyle: TextStyle(
                          fontSize: 19, color: Colors.grey.shade500),
                      suffixIcon: suffix == true ? InkWell(
                          onTap: () {
                            iconChange.change();
                          },
                          child: value.show == true ? const Icon(
                              Icons.remove_red_eye_sharp, size: 22,
                              color: Colors.purple)
                              : const Icon(
                              Icons.lock, size: 22, color: Colors.purple)
                      ) : null,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              width: 2,
                              color: Colors.grey.shade500
                          ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            width: 2,
                            color: Colors.purple,
                          )
                      )
                  ))
          );
        });
  }
}