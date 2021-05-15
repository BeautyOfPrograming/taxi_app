import 'package:flutter/material.dart';
import 'package:taxi_app/AllScreens/Registration.dart';

import 'AllScreens/MainScreen.dart';
import 'AllScreens/LoginScreen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'taxi driver app',
      theme: ThemeData(
        fontFamily: "Signatra",
        primarySwatch: Colors.blue,
      ),
      home: RegisterScreen(),
    );
  }
}



