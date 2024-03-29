// ignore_for_file: unused_import, library_private_types_in_public_api, non_constant_identifier_names, file_names, prefer_typing_uninitialized_variables, avoid_function_literals_in_foreach_calls, depend_on_referenced_packages, unnecessary_null_comparison, prefer_const_constructors, duplicate_ignore
import 'dart:io';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'homePage.dart';

// var urlOfImages;
var NumberOfDataOfCategoriesFormFirebase;
var NumberOfDataOfUsersFromFirebase;
List NameOfCategories = [];
/////users= Names of Dectors
///
///
List users = [];

class SplashPage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  CollectionReference Categories =
      FirebaseFirestore.instance.collection("Categories");

  ///getDataOfCategories
  ///
  ///
////////////////////////////////////////////////////////////////////////
  getDataOfCategories() async {
    var responsebody = await Categories.get();
    responsebody.docs.forEach((element) {
      setState(() {
        if (element != null) {
          NameOfCategories.add(element);
        }
      });

      NumberOfDataOfCategoriesFormFirebase = responsebody.size;
    });
  }
  /////////////////////////////////////////////////////////////////////

  CollectionReference usersref = FirebaseFirestore.instance.collection("users");

  getDataOfusers() async {
    var responsebody = await usersref.get();
    responsebody.docs.forEach((element) {
      setState(() {
        users.add(element);
      });
    });
    NumberOfDataOfUsersFromFirebase = responsebody.size;
  }
//////////////////////////////////////////////////////////////////////////////////////////////
// final firebase_storage.FirebaseStorage storage=firebase_storage.FirebaseStorage.instance;

// void  listFiles()async{

//   firebase_storage.ListResult rr= await storage.refFromURL('images').listAll();

//   rr.items.forEach(( ref) {

//     setState(() {
//       urlOfImages.add(ref);
//     });
//    });

// print('=======================');

// print(urlOfImages);

// }

// getImages()async{

//   var ref=await FirebaseStorage.instance.ref("/images").list();

//   ref.items.forEach((element) {

//     urlOfImages=element.bucket;
// print("==============================");

// print(element.name);

//    });
// }

  @override
  void initState() {
    getDataOfCategories();
    getDataOfusers();
    //listFiles();
    // getImages();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset("images/image5.jpg"),
      // ignore: prefer_const_constructors
      title: Text(
        "Thank you for your patience",
        style: TextStyle(
            fontSize: 22.0, fontWeight: FontWeight.bold, color: Colors.black),
      ),
      // ignore: use_full_hex_values_for_flutter_colors
      backgroundColor: Color(0XFFF9DB5B2),
      showLoader: true,
      loadingText: Text(
        "Loading...",
        style: TextStyle(fontSize: 16.0, color: Colors.black),
      ),
      navigator: HomePage(),
      loaderColor: Colors.black,
      durationInSeconds: 5,
    );
  }
}
