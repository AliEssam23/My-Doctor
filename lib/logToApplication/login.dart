// ignore_for_file: unused_import, duplicate_ignore, prefer_const_constructors_in_immutables, use_full_hex_values_for_flutter_colors, prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, avoid_print, use_build_context_synchronously, unnecessary_null_comparison, unnecessary_new
import 'dart:async';

import 'package:application_team/logToHomePage/homePage.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../logToHomePage/pageOfSplashScreen1.dart';

// ignore: unused_import

bool stateButton = false;

class LogIn extends StatefulWidget {
  LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  // ignore: non_constant_identifier_names
  late String EmailOfUser, PasswordOfUser;

  ///
  ///GlobalKey
  ///
  ///
  ///
  ///
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();

  ///Log in to Application
  ///
  ///
  ///
  ///
  ///
  ///
  logIn() async {
    var formData = formstate.currentState;
    if (formData!.validate()) {
      ///Save values in var.s
      ///
      ///
      ///
      formData.save();
      // ignore: avoid_print
      print("valid");

      ///process if Log in = true
      ///
      ///
      ///
      ///
      ///
      ///

      try {
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: EmailOfUser, password: PasswordOfUser);

        return credential;
      }
      /////
      ///
      ///process if Log in= false
      ///
      ///
      ///

      on FirebaseAuthException catch (e) {
        ////
        ///
        ///
        ///
        ///
        ///
        ///
        ///
        if (e.code == 'user-not-found') {
          print('No user found for that email.');

          final snackBar = SnackBar(
            duration: Duration(milliseconds: 2000),

            /// need to set following properties for best effect of awesome_snackbar_content
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            content: AwesomeSnackbarContent(
              color: Color(0XFFF9DB5B2),
              title: 'Warning!',
              message: 'No user found for that email.',

              /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
              contentType: ContentType.warning,
            ),
          );

          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(snackBar);
        }
        ////
        ///
        ///
        ///
        ///
        ///
        ///
        ///

        else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');

          final snackBar = SnackBar(
            duration: Duration(milliseconds: 2000),

            /// need to set following properties for best effect of awesome_snackbar_content
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            content: AwesomeSnackbarContent(
              color: Color(0XFFF9DB5B2),
              title: 'Warning!',
              message: 'Wrong password provided for that user.',

              /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
              contentType: ContentType.warning,
            ),
          );

          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(snackBar);
        }
      }
    } else {
      print("Not valid");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFF9DB5B2),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        child: Form(
          ///
          ///
          ///key of form
          ///
          ///
          ///
          ///
          key: formstate,
          child: Column(
            children: [
              SizedBox(
                height: 150.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Text(
                  //   "Welcome",
                  //   style: TextStyle(fontSize: 40,textBaseline: TextBaseline.ideographic,),
                  // )

                  Icon(
                    Icons.account_circle_outlined,
                    size: 175.0,
                    color: Colors.white70,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        blurRadius: 70.0,
                        offset: Offset(0.0, 0.0),
                      )
                    ],
                  ),
                ],
              ),
              Row(children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Container(
                      margin: EdgeInsets.only(top: 15, left: 10),
                      child: Text(
                        "Email",
                        style: TextStyle(fontSize: 16.0, color: Colors.black),
                      )),
                  Container(
                      width: 350.0,
                      height: 65.0,
                      margin: EdgeInsets.only(top: 10, left: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: TextFormField(
                          onSaved: ((emailOfUser) {
                            EmailOfUser = emailOfUser!;
                          }),
                          validator: ((emailOfUser) {
                            if (emailOfUser!.length > 40) {
                              return "The Email cannot be more than forty";
                            } else if (emailOfUser.length < 3) {
                              return "The Email cannot be less than three";
                            } else {
                              return null;
                            }
                          }),
                          decoration: InputDecoration(
                              fillColor: Colors.transparent,
                              hintText: "user@example.com",
                              filled: true,
                              //fillColor: Colors.black

                              suffix: Icon(Icons.email),
                              border: InputBorder.none),
                        ),
                      ))
                ])
              ]),

              ////Start
              ///
              ///
              ///
              ///
              ///
              ///
              Row(children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Container(
                      margin: EdgeInsets.only(
                        top: 15,
                        left: 10,
                      ),
                      child: Text(
                        "Password",
                        style: TextStyle(fontSize: 16.0, color: Colors.black),
                      )),
                  Container(
                      width: 350.0,
                      height: 65.0,
                      margin: EdgeInsets.only(top: 10, left: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: TextFormField(
                          onSaved: ((passwordOfUser) {
                            PasswordOfUser = passwordOfUser!;
                          }),
                          validator: ((passwordOfUser) {
                            if (passwordOfUser!.length < 8) {
                              return "The symbol cannot be less than eight";
                            } else if (passwordOfUser.length > 20) {
                              return "The symbol cannot be greater than twenty";
                            } else {
                              return null;
                            }
                          }),
                          obscureText: (stateButton == false) ? true : false,
                          decoration: InputDecoration(
                              fillColor: Colors.transparent,
                              errorBorder: InputBorder.none,
                              suffix: (stateButton == false)
                                  ? IconButton(
                                      icon: Icon(Icons.visibility_off_outlined),
                                      onPressed: () {
                                        print(stateButton);
                                        setState(() {
                                          stateButton = !stateButton;
                                        });
                                        print(stateButton);
                                      },
                                    )
                                  : IconButton(
                                      onPressed: () {
                                        setState(() {
                                          stateButton = !stateButton;
                                        });
                                      },
                                      icon: Icon(Icons.visibility_outlined)),
                              hintText: "Enter password",
                              filled: true,
                              //fillColor: Colors.black

                              border: InputBorder.none),
                        ),
                      ))
                ])
              ]),

              //////End
              ///
              ///
              ///
              ///
              /////////////////////////////////////////////

              ///Start
              ///
              ///
              ///
              ///
              ///
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 175.0,
                    height: 50.0,
                    margin: EdgeInsets.only(top: 20),
                    child: ElevatedButton(
                      onPressed: () async {
                        UserCredential response = await logIn();

                        if (response != null) {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) {
                            return SplashPage();
                          }));
                        } else {
                          final snackBar = SnackBar(
                            duration: Duration(milliseconds: 2000),

                            /// need to set following properties for best effect of awesome_snackbar_content
                            elevation: 0,
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.transparent,
                            content: AwesomeSnackbarContent(
                              color: Color(0XFFF9DB5B2),
                              title: 'Warning!',
                              message: 'Log in faild',

                              /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                              contentType: ContentType.warning,
                            ),
                          );

                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(snackBar);
                        }
                      },
                      child: Text(
                        "Log in",
                        style: TextStyle(fontSize: 19.0, color: Colors.black),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white70,
                        elevation: 10.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0)),
                        side: BorderSide(width: 0.5, color: Colors.black),
                      ),
                    ),
                  )
                ],
              )

              ///end
              ///
              ///
              ///
              ///
            ],
          ),
        ),
      ),
    );
  }
}
