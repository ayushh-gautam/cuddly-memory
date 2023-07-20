// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  String? mytext;
  bool obsecureText;
  Widget? suffixicon;
  Widget? prefixIcon;
  TextEditingController myController;

  MyTextField({
    Key? key,
    required this.mytext,
    required this.obsecureText,
    this.suffixicon,
    this.prefixIcon,
    required this.myController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 25, right: 25),
      child: TextFormField(
        controller: myController,
        obscureText: obsecureText,
        decoration: InputDecoration(
            prefixIcon: prefixIcon,
            suffixIcon: suffixicon,
            border: InputBorder.none,
            fillColor: Colors.grey.shade100,
            filled: true,
            hintText: mytext,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey.shade400)),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue.shade400),
              borderRadius: BorderRadius.circular(12),
            )),
      ),
    );
  }
}
