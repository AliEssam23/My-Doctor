// ignore_for_file: file_names, non_constant_identifier_names, prefer_const_constructors, duplicate_ignore, use_full_hex_values_for_flutter_colors, unnecessary_string_interpolations, unused_import, use_build_context_synchronously, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

import '../main.dart';

class PageViewOfDoctor extends StatefulWidget {
  final String Name;
  final String SubName;
  final String Location;
  final String Star;
  final String Reviews;
  final String Years_exp;
  final String Petients;
  final String Demography;
  final String uriOfImage;
  final String NumberOfPhone;
  // ignore: prefer_const_constructors_in_immutables
  PageViewOfDoctor({
    Key? key,
    required this.Name,
    required this.SubName,
    required this.Location,
    required this.Star,
    required this.Reviews,
    required this.Years_exp,
    required this.Petients,
    required this.Demography,
    required this.uriOfImage,
    required this.NumberOfPhone,
  }) : super(key: key);
  @override
  State<PageViewOfDoctor> createState() => _PageViewOfDoctorState();
}

bool stateOfFavorite_outlined = false;
bool stateOfstar_outlined = false;

class _PageViewOfDoctorState extends State<PageViewOfDoctor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
// ignore: prefer_const_constructors, use_full_hex_values_for_flutter_colors
      backgroundColor: Color(0XFFF9DB5B2),

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_outlined,
            size: 27.0,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.logout_outlined,
              size: 27.0,
              color: Colors.black,
            ),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();

              Navigator.of(context)
                  .pushReplacement(MaterialPageRoute(builder: (context) {
                return MyApp();
              }));
            },
          )
        ],
      ),

      body: Container(
        margin: EdgeInsets.only(bottom: 2.0, right: 10.0, left: 10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 105.0,
              ),

              Container(
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        /////////Container of Image
                        Container(
                          width: 110.0,
                          height: 130.0,
                          decoration: BoxDecoration(
                              // ignore: use_full_hex_values_for_flutter_colors
                              color: Color(0XFFF9DB5B2),
                              image: DecorationImage(
                                  image: NetworkImage("${widget.uriOfImage}"),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(20)),
                        )
                      ],
                    ),
                    // Container of information
                    Container(
                      color: Colors.transparent,
                      width: 150.0,
                      height: 130.0,
                      margin: EdgeInsets.only(left: 12.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            // ignore: unnecessary_string_interpolations
                            children: [
                              Text(
                                "${widget.Name}",
                                style: GoogleFonts.courgette(
                                    fontSize: 20.0, color: Colors.black),
                              ),
                            ],
                          ),
                          Row(
                            // ignore: unnecessary_string_interpolations
                            children: [
                              Text("${widget.SubName}",
                                  style: GoogleFonts.courgette(
                                      fontSize: 20.0, color: Colors.black))
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on_outlined,
                                color: Colors.red,
                              ),
                              Text(widget.Location,
                                  style: GoogleFonts.courgette(
                                      fontSize: 20.0, color: Colors.black))
                            ],
                          ),
                          Row(
                            /////////////////////////mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 100.0,
                                height: 40.0,
                                decoration: BoxDecoration(
                                    color: Colors.white38,
                                    borderRadius: BorderRadius.circular(10)),

                                // button of
                                // star
                                //
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        child: Icon(
                                          size: 27.0,
                                          Icons.star_outlined,
                                          color: (stateOfstar_outlined != true)
                                              ? Colors.black
                                              : Color(0XFFFFfe10c),
                                        ),
                                        onTap: () {
                                          setState(() {
                                            stateOfstar_outlined = true;
                                          });
                                        },
                                        onDoubleTap: () {
                                          setState(() {
                                            stateOfstar_outlined = false;
                                          });
                                        },
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            children: [
                                              Text(widget.Star,
                                                  style: GoogleFonts.courgette(
                                                      fontSize: 18.0)),
                                              Text("Star",
                                                  style: GoogleFonts.courgette(
                                                      fontSize: 18.0)),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ]),
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Container(
                                width: 40,
                                height: 40.0,
                                decoration: BoxDecoration(
                                    // ignore: use_full_hex_values_for_flutter_colors
                                    color: Colors.white38,
                                    borderRadius: BorderRadius.circular(10)),
                                child:
                                    // button of
                                    // favorite
                                    //
                                    InkWell(
                                  splashColor: Colors.transparent,
                                  child: Icon(
                                    Icons.favorite_outlined,
                                    size: 27.0,
                                    color: (stateOfFavorite_outlined != true)
                                        ? Colors.black
                                        : Colors.red,
                                  ),
                                  onTap: () {
                                    setState(() {
                                      stateOfFavorite_outlined = true;
                                    });
                                  },
                                  onDoubleTap: () {
                                    setState(() {
                                      stateOfFavorite_outlined = false;
                                    });
                                  },
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),

              /////////////////////// Container of Rev. and Years exp. and Petients
              Container(
                // ignore: prefer_const_constructors
                margin: EdgeInsets.only(top: 15.0),

                height: 70.0,
                decoration: BoxDecoration(
                    color: Colors.white38,
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    columnOfReAndYeAndPe("Reviews", widget.Reviews),
                    columnOfReAndYeAndPe("Years exp.", widget.Years_exp),
                    columnOfReAndYeAndPe("Petients", widget.Petients),
                  ],
                ),
              ),
              containerOfLocationAndDemography("Demography"),

              //////////////////////// Container of Demography
              Container(
                  width: double.maxFinite,
                  height: 150,
                  decoration: BoxDecoration(
                      // ignore: use_full_hex_values_for_flutter_colors
                      color: Colors.white38,
                      borderRadius: BorderRadius.circular(20)),
                  // ignore: prefer_const_constructors
                  margin: EdgeInsets.only(top: 10.0),
                  // ignore: prefer_const_constructors
                  padding: EdgeInsets.all(5.0),
                  child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.Demography,
                            style: GoogleFonts.courgette(fontSize: 20.0),
                          ),
                        ]),
                  )),
              containerOfLocationAndDemography("Location"),
              //////////////////////// Container of Location
              ///+
              ///SnackBar
              InkWell(
                splashColor: Colors.transparent,
                onTap: () {
                  final snackBar = SnackBar(
                    duration: Duration(milliseconds: 2000),

                    /// need to set following properties for best effect of awesome_snackbar_content
                    elevation: 0,
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.transparent,
                    content: AwesomeSnackbarContent(
                      color: Color(0XFFF9DB5B2),
                      title: 'Warning!',
                      message: 'This feature will be added later',

                      /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                      contentType: ContentType.warning,
                    ),
                  );

                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(snackBar);
                },
                child: Container(
                  width: double.maxFinite,
                  height: 140,
                  // ignore: prefer_const_constructors
                  margin: EdgeInsets.only(top: 10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0XFFF9DB5B2),
                    // ignore: prefer_const_constructors
                    image: DecorationImage(
                        // ignore: prefer_const_constructors
                        image: AssetImage("images/imagesOfLocation.jpg"),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              //container of
              // phone
              //  mail
              Container(
                width: double.maxFinite,
                height: 55.0,
                margin: EdgeInsets.only(top: 15),
                decoration: BoxDecoration(
                    // ignore: use_full_hex_values_for_flutter_colors
                    color: Colors.white38,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                        icon: Icon(
                          Icons.phone_outlined,
                          size: 35.0,
                        ),
                        onPressed: () {
                          final Uri url =
                              Uri.parse("tel:${widget.NumberOfPhone}");
                          launchUrl(url);
                          print("Call phone");
                        }),
                    IconButton(
                      icon: Icon(
                        Icons.mail_outline_outlined,
                        size: 35.0,
                      ),
                      onPressed: () {
                        final Uri url =
                            Uri.parse("sms:${widget.NumberOfPhone}");
                        launchUrl(url);
                        print("Email");
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.video_call_outlined,
                        size: 35.0,
                      ),
                      onPressed: () {
                        print("Video Call");

                        final snackBar = SnackBar(
                          duration: Duration(milliseconds: 2000),

                          /// need to set following properties for best effect of awesome_snackbar_content
                          elevation: 0,
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.transparent,
                          content: AwesomeSnackbarContent(
                            color: Color(0XFFF9DB5B2),
                            title: 'Warning!',
                            message: 'This feature will be added later',

                            /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                            contentType: ContentType.warning,
                          ),
                        );

                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(snackBar);
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Column columnOfReAndYeAndPe(
      String ReviewsOrYearsExpOrPetients, String ValueOfReviews) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          ValueOfReviews,
          style: GoogleFonts.courgette(fontSize: 24.0),
        ),
        Text(
          ReviewsOrYearsExpOrPetients,
          style: GoogleFonts.courgette(fontSize: 18.0),
        ),
      ],
    );
  }

  Container containerOfLocationAndDemography(String LocationorDemography) {
    return Container(
        margin: EdgeInsets.only(top: 15.0),
        child: Row(
          children: [
            Text(
              LocationorDemography,
              style: GoogleFonts.courgette(
                fontSize: 40.0,
                color: Colors.black,
              ),
            )
          ],
        ));
  }
}
