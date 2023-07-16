import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:new_project/pages/modules/authPage.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MaterialApp(
    home: AuthPage(),
  ));
}
