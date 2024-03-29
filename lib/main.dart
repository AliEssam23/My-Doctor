// ignore: unused_import
// ignore_for_file: use_full_hex_values_for_flutter_colors, library_private_types_in_public_api, duplicate_ignore, sized_box_for_whitespace, non_constant_identifier_names, prefer_const_constructors, sort_child_properties_last
// ignore: unused_import
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
// ignore: unused_import
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:page_indicator/page_indicator.dart';
import 'logToHomePage/pageOfSplashScreen1.dart';
import 'loginMEthod/loginMethod.dart';

late bool StateUser;
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
// if user log in  in Application
//  stateUser=null -> StateUser=fale
//
//
  ///
  ///
  ///if user not log in  in Application
  ///stateUser=not null -> StateUser=true
  ///
  var stateUser = FirebaseAuth.instance.currentUser;
  if (stateUser == null) {
    StateUser = false;
  } else {
    StateUser = true;
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      ///
      ///return MyHomePage if StateUser=false
      ///and
      ///return SplashPage() if  StateUser= true
      home: (StateUser == false) ? MyHomePage() : SplashPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late PageController controller;

  GlobalKey<PageContainerState> key = GlobalKey();

  @override
  void initState() {
    super.initState();
    controller = PageController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Color(0XFFF9DB5B2),
      body: Container(
        height: double.infinity,
        child: PageIndicatorContainer(
          key: key,
          // ignore: sort_child_properties_last
          indicatorColor: Colors.white38,
          indicatorSelectorColor: Colors.black,
          child: PageView(
            
            pageSnapping: true,

            // ignore: sort_child_properties_last
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Welcome',
                    style: GoogleFonts.courgette(
                        fontSize: 44.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        shadows: [
                          Shadow(
                            color: Colors.black,
                            blurRadius: 70.0,
                            offset: Offset(0.0, 10.0),
                          )
                        ]),
                  ),
                ],
              ),
              //////////////////////////////////////////////////////////////
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("""   Do you suffer\nfrom any disease?""",
                      style: GoogleFonts.courgette(
                          fontSize: 44.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          shadows: [
                            Shadow(
                              color: Colors.black,
                              blurRadius: 70.0,
                              offset: Offset(0.0, 10.0),
                            )
                          ])),
                  // Text(
                  //   """from any disease?""",
                  //   style: GoogleFonts.courgette(
                  //       fontSize: 44.0,
                  //       fontWeight: FontWeight.w500,
                  //       color: Colors.black),
                  // )
                ],
              ),

              ////////////////////////////////////////////////////////////////
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 110.0,
                  ),
                  Text(
                    """  We have\nthe solution""",
                    style: GoogleFonts.courgette(
                        fontSize: 44.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        shadows: [
                          Shadow(
                            color: Colors.black,
                            blurRadius: 70.0,
                            offset: Offset(0.0, 10.0),
                          )
                        ]),
                  ),
                  // Text(
                  //   """the solution""",
                  //   style: GoogleFonts.courgette(
                  //       fontSize: 44.0,
                  //       fontWeight: FontWeight.w500,
                  //       color: Colors.white),
                  // ),
                  const SizedBox(
                    height: 60.0,
                  ),
                  Container(
                    width: 175.0,
                    height: 50.0,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white70,
                        elevation: 10.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0)),
                        side: const BorderSide(width: 0.5, color: Colors.black),
                      ),
                      // ignore: prefer_const_constructors
                      child: Text(
                        "Start used",
                        style: const TextStyle(
                            fontSize: 19.0, color: Colors.black),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) {
                          return LoginMethod();
                        }));
                      },
                    ),
                  )
                ],
              ),
            ],
            controller: controller,
            reverse: false,
          ),
          // align: IndicatorAlign.bottom,
          length: 3,
          indicatorSpace: 10.0,
        ),
      ),
    );
  }
}
