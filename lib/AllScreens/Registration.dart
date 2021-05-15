

import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
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
                            "Create an account",
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
                child: Text("Already  have an Account ? Login here"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
