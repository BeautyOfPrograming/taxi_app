import 'dart:html';

import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 150.0,
              ),
              Image(
                image: AssetImage("images/logo.png"),
                width: 385,
                height: 205,
                alignment: Alignment.center,
              ),
              SizedBox(height: 1.0),
              Text(
                "Log in as a rider",
                style: TextStyle(fontSize: 24.0, fontFamily: "Brand Bold"),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    SizedBox(height: 10.1),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "Enter your Email and address",
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
                    SizedBox(height: 1.0),
                    RaisedButton(
                      color: Colors.yellow,
                      textColor: Colors.white,
                      child: Container(
                        height: 50.0,
                        child: Center(
                          child: Text(
                            "Login",
                            style:
                                TextStyle(fontSize: 10.0, fontFamily: "Brand Bold"),
                          ),
                        ),
                      ),
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(24.0)),
                    )
                  ],
                ),
              ),
              FlatButton(
                onPressed: () {
                  print("clicked me");
                },
                child: Text("Do not have an Account ? Register here"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
