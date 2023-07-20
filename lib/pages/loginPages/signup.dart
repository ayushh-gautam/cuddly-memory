// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_project/pages/modules/authPage.dart';
import 'package:new_project/pages/widgets/myButton.dart';
import 'package:new_project/pages/widgets/textBox.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final cpassController = TextEditingController();
  bool _passobsecureText = false;
  bool _cpassobsecureText = false;

  void register() async {
    if (passController.text == cpassController.text) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text, password: passController.text);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => AuthPage()));
      } on FirebaseException catch (e) {
        showwError(e.code);
      }
    } else {
      showwError('Password doesnot match');
    }
  }

  void showwError(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Center(
              child: Text(
                message,
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Center(
          child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12)),
        margin: EdgeInsets.only(
          left: 25,
          right: 25,
        ),
        width: double.infinity,
        height: MediaQuery.sizeOf(context).height * 0.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sign-up',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 30,
            ),
            MyTextField(
                prefixIcon: Icon(
                  Icons.person,
                  color: Colors.green,
                ),
                mytext: 'Enter your email',
                obsecureText: false,
                myController: emailController),
            SizedBox(
              height: 20,
            ),
            MyTextField(
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.green,
                ),
                mytext: 'Enter your password',
                suffixicon: GestureDetector(
                  onTap: () {
                    setState(() {
                      _passobsecureText = !_passobsecureText;
                    });
                  },
                  child: Icon(_passobsecureText
                      ? Icons.visibility
                      : Icons.visibility_off),
                ),
                obsecureText: _passobsecureText,
                myController: passController),
            SizedBox(
              height: 20,
            ),
            MyTextField(
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.green,
                ),
                mytext: 'Confirm password',
                obsecureText: _cpassobsecureText,
                suffixicon: GestureDetector(
                  onTap: () {
                    setState(() {
                      _cpassobsecureText = !_cpassobsecureText;
                    });
                  },
                  child: Icon(_cpassobsecureText
                      ? Icons.visibility
                      : Icons.visibility_off),
                ),
                myController: cpassController),
            SizedBox(
              height: 20,
            ),
            MyButton(onTap: register, sText: 'Register')
          ],
        ),
      )),
    );
  }
}
