// ignore_for_file: file_names, use_full_hex_values_for_flutter_colors, prefer_const_constructors, prefer_const_literals_to_create_immutables, duplicate_ignore, sort_child_properties_last, prefer_const_constructors_in_immutables, avoid_print, unnecessary_null_comparison, use_build_context_synchronously, unnecessary_new

// ignore: unused_import
import 'package:application_team/logToHomePage/homePage.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'dart:async';

import '../logToHomePage/pageOfSplashScreen1.dart';

bool stateButton = false;

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  // ignore: non_constant_identifier_names
  late String NameOfUser, EmailOfUser, PasswordOfUser;
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();

  signUp() async {
    var formData = formstate.currentState;
    if (formData!.validate()) {
      formData.save();
      print("valid");
      print(NameOfUser);

      try {
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: EmailOfUser,
          password: PasswordOfUser,
        );

        return credential;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');

          final snackBar = SnackBar(
            duration: Duration(milliseconds: 2000),

            /// need to set following properties for best effect of awesome_snackbar_content
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            content: AwesomeSnackbarContent(
              color: Color(0XFFF9DB5B2),
              title: 'Warning!',
              message: 'The password provided is too weak.',

              /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
              contentType: ContentType.warning,
            ),
          );

          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(snackBar);
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');

          final snackBar = SnackBar(
            duration: Duration(milliseconds: 2000),

            /// need to set following properties for best effect of awesome_snackbar_content
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            content: AwesomeSnackbarContent(
              color: Color(0XFFF9DB5B2),
              title: 'Warning!',
              message: 'The account already exists for that email.',

              /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
              contentType: ContentType.warning,
            ),
          );

          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(snackBar);
        }
      } catch (e) {
        print(e);
      }

////////////////////////////////////////

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
          key: formstate,
          child: Column(
            children: [
              SizedBox(
                height :100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Text(
                  //   "Welcome",
                  //   style: TextStyle(
                  //     fontSize: 40,
                  //     textBaseline: TextBaseline.ideographic,
                  //   ),
                  // ),
                  Icon(
                    Icons.people_outlined,
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

              ///start
              ///
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
                        top: 10,
                        left: 10,
                      ),
                      child: Text(
                        "Name",
                        style: TextStyle(fontSize: 16.0, color: Colors.black),
                      )),
                  Container(
                      width: 350.0,
                      height: 60.0,
                      margin: EdgeInsets.only(top: 10, left: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),

                      ///////////////////////////////////////////// Text form field of Name
                      child: Center(
                        child: TextFormField(
                          onSaved: (nameOfUser) {
                            NameOfUser = nameOfUser!;
                          },
                          validator: ((nameOfUser) {
                            if (nameOfUser!.length < 3) {
                              return "Name cannot be less than three letters";
                            }

                            if (nameOfUser.length > 40) {
                              return "The name cannot be more than forty";
                            } else {
                              return null;
                            }
                          }),
                          decoration: InputDecoration(
                              fillColor: Colors.transparent,
                              hintText: "Name",
                              filled: true,
                              //fillColor: Colors.black

                              suffix: Icon(
                                Icons.perm_identity_outlined,
                              ),
                              border: InputBorder.none),
                        ),
                      ))
                ])
              ]),

              ///end
              ///
              ///
              /// //////////////////////////////////////////////////////

              ///start
              ///
              ///
              ///
              ///
              ///
              ///
              ///
              ///

              Row(children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Container(
                      margin: EdgeInsets.only(left: 10, top: 15),
                      child: Text(
                        "Email",
                        style: TextStyle(fontSize: 16.0, color: Colors.black),
                      )),
                  Container(
                      width: 350.0,
                      height: 60.0,
                      margin: EdgeInsets.only(top: 10, left: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      ///////////////////////////////////////////// Text form field of Email
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

              /////end
////////////////////////////////////////////////////////////////////////
              ///

              ///star
              ///
              ///
              ///
              ///

              Row(children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Container(
                      margin: EdgeInsets.only(top: 20, left: 10),
                      child: Text(
                        "Password",
                        style: TextStyle(fontSize: 16.0, color: Colors.black),
                      )),
                  Container(
                      width: 350.0,
                      height: 60.0,
                      margin: EdgeInsets.only(top: 10, left: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      ///////////////////////////////////////////// Text form field of Password
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
                          // ignore: prefer_const_constructors
                          decoration: InputDecoration(
                            fillColor: Colors.transparent,

                            hintText: "Enter password",
                            filled: true,
                            //fillColor: Colors.black

                            border: InputBorder.none,
                            suffix: (stateButton == false)
                                ? IconButton(
                                    icon: Icon(Icons.visibility_off_outlined),
                                    onPressed: () {
                                      setState(() {
                                        stateButton = !stateButton;
                                      });
                                    },
                                  )
                                : IconButton(
                                    onPressed: () {
                                      setState(() {
                                        stateButton = !stateButton;
                                      });
                                    },
                                    icon: Icon(Icons.visibility_outlined)),
                          ),
                        ),
                      ))
                ])
              ]),

              ///end

///////////////////////////////////////////////////////////////

              ////start
              ///
              ///
              ///
              ///
              ///
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Sign In
                  Container(
                    width: 175.0,
                    height: 50.0,
                    margin: EdgeInsets.only(top: 20),
                    child: ElevatedButton(
                      onPressed: () async {
                        UserCredential response = await signUp();

                        if (response != null) {
                          // ignore: use_build_context_synchronously
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
                              message: 'Sign up faild',

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
                        "Sign up",
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
            ],
          ),
        ),
      ),
    );
  }
}
