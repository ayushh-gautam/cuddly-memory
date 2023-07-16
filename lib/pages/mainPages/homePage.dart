// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 400,
                width: 400,
                color: Colors.red,
                child: Text('HOw are you'),
              ),
              GestureDetector(
                  onTap: () {
                    FirebaseAuth.instance.signOut();
                  },
                  child: Container(
                    child: Text('LOgout'),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
