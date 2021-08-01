import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:taxi_app/AllScreens/Registration.dart';

import 'AllScreens/MainScreen.dart';
import 'AllScreens/LoginScreen.dart';

DatabaseReference userRef = FirebaseDatabase.instance.reference().child("Users");

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

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

      initialRoute: RegistrationScreen.idScreen,
      routes:{

         RegistrationScreen.idScreen :(context) => RegistrationScreen(),
         MainScreen.idScreen : (context)=>MainScreen(),
         LoginScreen.idScreen:(context)=>LoginScreen()

      }

    );
  }
}



