// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  void Function()? onTap;
  String sText;
  MyButton({
    Key? key,
    required this.onTap,
    required this.sText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(left: 100, right: 100),
        width: double.infinity,
        height: 50.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.green.shade400,
        ),
        child: Text(
          sText,
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
