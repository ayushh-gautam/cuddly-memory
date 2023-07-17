// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_project/pages/widgets/myButton.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).devicePixelRatio * 28,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade500,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        user.displayName != null
                            ? 'Welcome  ' + user.displayName!
                            : 'Welcome ' + user.email!,
                        style: TextStyle(color: Colors.white, fontSize: 19),
                      ),
                      ClipOval(
                        child: user.photoURL != null
                            ? Image.network(user.photoURL!)
                            : Image.asset('lib/assets/default.jpg'),
                      )
                    ],
                  ),
                ),
              ),
              MyButton(
                  onTap: () {
                    FirebaseAuth.instance.signOut();
                  },
                  sText: 'Sign Out'),
            ],
          ),
        ),
      ),
    );
  }
}
