import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:taxi_app/main.dart';

import 'LoginScreen.dart';
import 'MainScreen.dart';

class RegistrationScreen extends StatelessWidget {
  static const String idScreen = "register";

  TextEditingController nameEditingController = TextEditingController();
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController phoneEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 138.0,
              ),
              Image(
                image: AssetImage("images/logo.png"),
                width: 385,
                height: 205,
                alignment: Alignment.center,
              ),
              SizedBox(height: 1.0),
              Text(
                "Register in as a rider",
                style: TextStyle(fontSize: 24.0, fontFamily: "Brand Bold"),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    SizedBox(height: 10.1),
                    TextFormField(
                      controller: nameEditingController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: "Name",
                        labelStyle:
                            TextStyle(fontSize: 15, fontFamily: "Brand Bold"),
                        hintStyle: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      style: TextStyle(fontSize: 19),
                    ),
                    SizedBox(height: 10.1),
                    TextFormField(
                      controller: emailEditingController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "Email",
                        labelStyle:
                            TextStyle(fontSize: 15, fontFamily: "Brand Bold"),
                        hintStyle: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      style: TextStyle(fontSize: 19),
                    ),
                    SizedBox(height: 10.1),
                    TextFormField(
                      controller: phoneEditingController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: "Phone",
                        labelStyle:
                            TextStyle(fontSize: 15, fontFamily: "Brand Bold"),
                        hintStyle: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      style: TextStyle(fontSize: 19),
                    ),
                    SizedBox(height: 10.1),
                    TextFormField(
                      controller: passwordEditingController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle:
                            TextStyle(fontSize: 15, fontFamily: "Brand Bold"),
                        hintStyle: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      style: TextStyle(fontSize: 19),
                    ),
                    SizedBox(height: 25.0),
                    RaisedButton(
                      color: Colors.green,
                      textColor: Colors.white,

                      child: Container(
                        height: 50.0,
                        child: Center(
                          child: Text(
                            "Create an account",
                            style: TextStyle(
                                fontSize: 10.0, fontFamily: "Brand Bold"),
                          ),
                        ),
                      ),


                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(24.0)),
                      onPressed: () {
                        if (nameEditingController.text.length < 6) {
                          displayToastMessage(
                              "The length of name is too short", context);
                        } else if (!emailEditingController.text.contains("@")) {
                          displayToastMessage(
                              "Please enter the correct format of email",
                              context);
                        } else if (phoneEditingController.text.isEmpty) {
                          displayToastMessage("Phone is mandatory !", context);
                        } else if (passwordEditingController.text.length < 7) {
                          displayToastMessage(
                              "The length of password is too short ", context);
                        } else {
                          registerNow(context);
                        }
                      },
                    ),
                  ],
                ),
              ),
              FlatButton(
                onPressed: () {
                  print("clicked me");

                  Navigator.pushNamedAndRemoveUntil(context, LoginScreen.idScreen, (route) => false);

                },
                child: Text("Already  have an Account ? Login here"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  final FirebaseAuth fire = FirebaseAuth.instance;

  void registerNow(BuildContext context) async {
    try {
      UserCredential user = await fire
          .createUserWithEmailAndPassword(
              email: emailEditingController.text,
              password: passwordEditingController.text);

      if (user != null) {
        // save user info to database
        Map userData = {
          "name": nameEditingController.text.trim(),
          "eamil": emailEditingController.text.trim(),
          "phone": phoneEditingController.text.trim(),
        };
        userRef.child(user.user.uid).set(userData);

        displayToastMessage(
            "Congratuation , your account has been created", context);
        Navigator.pushNamedAndRemoveUntil(context, MainScreen.idScreen, (route) => false);
      } else {
        displayToastMessage("User can not be created", context);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        displayToastMessage('The password provided is too weak.', context);
      } else if (e.code == 'email-already-in-use') {
        displayToastMessage(
            'The account already exists for that email.', context);
      }
    } catch (e) {
      print(e);
    }
  }

  void displayToastMessage(String message, BuildContext context) {
    Fluttertoast.showToast(msg: message);
  }
}
