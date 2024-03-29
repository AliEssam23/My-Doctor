// ignore_for_file: prefer_const_constructors_in_immutables, file_names, use_full_hex_values_for_flutter_colors, prefer_const_constructors, avoid_print, sort_child_properties_last, non_constant_identifier_names, duplicate_ignore, unused_import

import 'package:application_team/logToApplication/login.dart';
import 'package:application_team/logToApplication/signUp.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginMethod extends StatefulWidget {
  LoginMethod({Key? key}) : super(key: key);

  @override
  State<LoginMethod> createState() => _LoginMethodState();
}

class _LoginMethodState extends State<LoginMethod> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0XFFF9DB5B2),
        body: Center(
          child: Wrap(children: [
            Column(
              children: [
                Card(
                    child: CircleAvatarScreen("""images/image9.jpg"""),
                    color: Colors.white70,
                    elevation: 10.0,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(width: 0.5, color: Colors.black),
                        borderRadius: BorderRadius.circular(170.0))),

                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //   ContainerText("My"),
                // ContainerText("Doctor"),
                // ],),

                Container(
                    width: 175.0,
                    height: 50.0,
                    margin: EdgeInsets.only(top: 10),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                            builder: (context) {
                              return LogIn();
                            },
                          ));

                          print("Log in");
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
                        ))),
                Container(
                    width: 175.0,
                    height: 50.0,
                    margin: EdgeInsets.only(top: 10),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                            builder: (context) {
                              return SignUp();
                            },
                          ));
                          print("Sign up");
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
                        ))),
              ],
            ),
          ]),
        ));
  }

  // ignore: non_constant_identifier_names
  // Container ContainerText(String TextOut) {
  //   return Container(
  //       color: Colors.transparent,
  //       child: Text(TextOut,
  //           style: GoogleFonts.courgette(
  //             fontSize: 44.0,
  //             color: Colors.white,
  //           )));
  // }

  CircleAvatar CircleAvatarScreen(String urlScreen) {
    return CircleAvatar(
      radius: 160.0,
      backgroundImage: AssetImage(urlScreen),
      backgroundColor: Color(0XFFF9DB5B2),
    );
  }
}
