
import 'package:appdelivery/views/home_page/home.dart';
import 'package:appdelivery/views/resource/login_screen.dart';
import 'package:appdelivery/views/resource/test_map.dart';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MapScreen(),
    );
  }
}


