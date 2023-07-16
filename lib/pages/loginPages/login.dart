// ignore_for_file: prefer_const_constructors, avoid_print, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:new_project/pages/loginPages/signup.dart';
import 'package:new_project/pages/modules/authPage.dart';
import 'package:new_project/pages/modules/authService.dart';
import 'package:new_project/pages/widgets/myButton.dart';
import 'package:new_project/pages/widgets/textBox.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void signIn() async {
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        });
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passController.text);
      Navigator.pop(context);
    } on FirebaseException catch (e) {
      Navigator.pop(context);
      showError(e.code);
    }
  }

  void showError(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            insetAnimationDuration: Duration(milliseconds: 200),
            title: Center(
              child: Text(
                message,
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          );
        });
  }

  final emailController = TextEditingController();
  final passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, Constraints) => Center(
            child: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                padding: EdgeInsets.only(top: 40),
                margin: EdgeInsets.only(
                  left: 25,
                  right: 25,
                ),
                width: double.infinity,
                height: Constraints.maxHeight * 0.7,
                child: Column(
                  children: [
                    Image.asset(
                      'lib/assets/login.png',
                      height: 120,
                      width: 120,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'LOG-IN',
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    MyTextField(
                      myController: emailController,
                      mytext: 'Enter your email.',
                      obsecureText: false,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    MyTextField(
                      myController: passController,
                      mytext: 'Enter your password',
                      obsecureText: true,
                    ),

                    SizedBox(
                      height: 20,
                    ),

                    //  sign in button

                    MyButton(
                      sText: 'Sign in',
                      onTap: () {
                        signIn();
                      },
                    ),

                    SizedBox(
                      height: 15,
                    ),

                    Text(
                      '----or continue with----',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 19,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                        onTap: () {
                          AuthService().signInWithGoogle();
                        },
                        child: Image.asset(
                          'lib/assets/google.png',
                          height: 45,
                          width: 45,
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t have an account?',
                          style: TextStyle(
                            color: Colors.purple.shade800,
                            fontSize: 19,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return SignUp();
                            }));
                          },
                          child: Text(
                            ' Register',
                            style: TextStyle(
                              color: Colors.purple.shade800,
                              fontSize: 19,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
