// ignore_for_file: avoid_print, duplicate_ignore, unused_import, non_constant_identifier_names, avoid_function_literals_in_foreach_calls, use_full_hex_values_for_flutter_colors, prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names, null_check_always_fails, prefer_const_constructors_in_immutables, avoid_unnecessary_containers, prefer_typing_uninitialized_variables

import 'package:application_team/logToHomePage/logToPage2.dart';
import 'package:application_team/logToHomePage/pageOfSplashScreen1.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: unused_import
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:google_fonts/google_fonts.dart';

var NumberOfDataFromFirebase;

List imagesOfDoctros = [
  """https://img.freepik.com/free-photo/portrait-smiling-handsome-male-doctor-man_171337-5055.jpg?w=996&t=st=1672489421~exp=1672490021~hmac=fa2716615f59a5a38234fa0de70a27185020ae3b0bb3e6abc697398619e5e8f1""",
  """https://img.freepik.com/free-photo/portrait-successful-young-doctor-with-folder-stethoscope_1262-12410.jpg?w=996&t=st=1672489458~exp=1672490058~hmac=4feed0766e7c63f745fa0e6ba153ecfdec70e9bbd202512bb3abe7ea469467ff""",
  """https://img.freepik.com/free-photo/hospital-healthcare-workers-covid-19-treatment-concept-young-doctor-scrubs-making-daily-errands-clinic-listening-patient-symptoms-look-camera-professional-physician-curing-diseases_1258-57233.jpg?w=996&t=st=1672489507~exp=1672490107~hmac=4f77db65db5e477ca45b91440dad793223f419639d4f55532e57e3d1532a447d""",
  """https://img.freepik.com/free-photo/portrait-hansome-young-male-doctor-man_171337-5068.jpg?w=996&t=st=1672489522~exp=1672490122~hmac=a457eaeca4b7df7d3e71bf4c8f0fb9a15a587a17e9a6e986b3294d472111c336""",
  """https://img.freepik.com/premium-photo/african-doctor-portrait_93675-75299.jpg?size=626&ext=jpg&ga=GA1.2.1993500489.1669740691""",
  """https://img.freepik.com/free-photo/doctor-with-co-workers-analyzing-x-ray_1098-581.jpg?size=626&ext=jpg&ga=GA1.2.1993500489.1669740691""",
  """https://img.freepik.com/free-photo/portrait-smiling-male-doctor_171337-1532.jpg?size=626&ext=jpg&ga=GA1.2.1993500489.1669740691""",
  """https://img.freepik.com/premium-photo/portrait-smiling-nurse-hospital_53419-1056.jpg?size=626&ext=jpg&ga=GA1.2.1993500489.1669740691""",
  """https://img.freepik.com/free-photo/doctor-with-his-arms-crossed-white-background_1368-5790.jpg?size=338&ext=jpg&ga=GA1.2.1993500489.1669740691""",
  """https://img.freepik.com/free-photo/young-lady-looking-pointing-copy-space_171337-5771.jpg?size=626&ext=jpg&ga=GA1.2.1993500489.1669740691""",
  """https://img.freepik.com/premium-photo/covid-19-coronavirus-outbreak-healthcare-workers-pandemic-concept-middle-aged-doctor-white-coat-cross-arms-chest-ready-help-patients-prescribe-medication-smiling-cheerful_1258-61179.jpg?size=626&ext=jpg&ga=GA1.2.1993500489.1669740691""",
  """https://img.freepik.com/free-photo/medical-doctor-girl-working-with-microscope-young-female-scientist-doing-vaccine-research_1157-48128.jpg?size=626&ext=jpg&ga=GA1.2.1993500489.1669740691""",
  """https://img.freepik.com/free-photo/beautiful-young-female-doctor-looking-camera-office_1301-7807.jpg?size=338&ext=jpg&ga=GA1.2.1993500489.1669740691""",
  """https://img.freepik.com/free-photo/medium-shot-doctor-with-crossed-arms_23-2148868176.jpg?size=626&ext=jpg&ga=GA1.2.1993500489.1669740691""",
];

class PageViewDoctors extends StatefulWidget {
  final String Name;
  final String urlOfCategorie;
  PageViewDoctors({
    Key? key,
    required this.Name,
    required this.urlOfCategorie,
  }) : super(key: key);
  @override
  State<PageViewDoctors> createState() => _PageViewDoctorsState();
}

class _PageViewDoctorsState extends State<PageViewDoctors> {
  // CollectionReference usersref = FirebaseFirestore.instance.collection("users");

  // getData() async {
  //   var responsebody = await usersref.get();
  //   responsebody.docs.forEach((element) {
  //     setState(() {
  //       users.add(element);
  //     });

  //   });
  //   NumberOfDataFromFirebase=responsebody.size;
  // }

  // getImagesFromFarebase() async {
  //   final storageRef = await FirebaseStorage.instance.ref().list();

  //   storageRef.items.forEach((element) {
  //     print("==============================");

  //     print(element);
  //   });
  // }

  // @override
  // void initState() {
  //   getData();
  //   // getImagesFromFarebase();
  //   super.initState();
  // }

//  bool _pinned = true;
//   bool _snap = false;
//   bool _floating = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
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
              Icons.search,
              size: 27.0,
              color: Colors.black,
            ),
            onPressed: () {
              showSearch(context: context, delegate: DataSearch());
            },
          )
        ],
      ),
      body: Container(
        child: CustomScrollView(
          slivers: <Widget>[
            // ignore: prefer_const_constructors
            SliverAppBar(
              pinned: false,
              snap: false,
              floating: false,
              expandedHeight: 100.0,
              backgroundColor: Color(0XFFF9DB5B2),
              automaticallyImplyLeading: false,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  widget.Name,
                  style: GoogleFonts.courgette(
                      fontSize: 28.0, color: Colors.black),
                ),
                centerTitle: true,
                stretchModes: [
                  StretchMode.zoomBackground,
                  StretchMode.blurBackground,
                  StretchMode.fadeTitle,
                ],
                background: Image(
                  image: NetworkImage(widget.urlOfCategorie),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white38,
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return PageViewOfDoctor(
                                Name: users[index]["Name"],
                                SubName: users[index]["SubName"],
                                Location: users[index]["Location"],
                                Star: users[index]["Star"],
                                Reviews: users[index]["Reviews"],
                                Years_exp: users[index]["Years_exp"],
                                Petients: users[index]["Petients"],
                                Demography: users[index]["Demography"],
                                uriOfImage: imagesOfDoctros[index],
                                NumberOfPhone: users[index]["Phone"],
                              );
                            }));
                          },
                          child: ListTile(
                              title: Text(users[index]["Name"],
                                  style: GoogleFonts.courgette(fontSize: 16.0)),
                              subtitle: Text(users[index]["SubName"],
                                  style: GoogleFonts.courgette(fontSize: 16.0)),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 2.0),
                              leading: CircleAvatar(
                                radius: 30.0,
                                backgroundImage:
                                    NetworkImage(imagesOfDoctros[index]),
                                backgroundColor: Color(0XFFF9DB5B2),
                              )),
                        ),
                      )
                    ],
                  );
                },
                childCount: NumberOfDataOfUsersFromFirebase,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DataSearch extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(
            Icons.close,
            size: 27.0,
          ),
          onPressed: () {
            query = "";
          }),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.arrow_back,
        size: 27.0,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return null!;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List fliterUsers =
        users.where((element) => element["Name"].contains(query)).toList();

    return Container(
      color: Color(0XFFF9DB5B2),
      child: ListView.builder(
        itemCount: (query == "")
            ? NumberOfDataOfUsersFromFirebase
            : fliterUsers.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white38,
            ),
            child: InkWell(
              onTap: () {
                //////////////////////////////////////////////////////////////////////////////////
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return PageViewOfDoctor(
                    Name: (query == "")
                        ? users[index]["Name"]
                        : fliterUsers[index]["Name"],
                    SubName: (query == "")
                        ? users[index]["SubName"]
                        : fliterUsers[index]["SubName"],
                    Location: (query == "")
                        ? users[index]["Location"]
                        : fliterUsers[index]["Location"],
                    Star: (query == "")
                        ? users[index]["Star"]
                        : fliterUsers[index]["Star"],
                    Reviews: (query == "")
                        ? users[index]["Reviews"]
                        : fliterUsers[index]["Reviews"],
                    Years_exp: (query == "")
                        ? users[index]["Years_exp"]
                        : fliterUsers[index]["Years_exp"],
                    Petients: (query == "")
                        ? users[index]["Petients"]
                        : fliterUsers[index]["Petients"],
                    Demography: (query == "")
                        ? users[index]["Demography"]
                        : fliterUsers[index]["Demography"],
                    uriOfImage: imagesOfDoctros[index],
                    NumberOfPhone: (query == "")
                        ? users[index]["Phone"]
                        : fliterUsers[index]["Phone"],
                  );
                }));
                //////////////////////////////////////////////////////////////////////////////////////////
              },
              child: ListTile(
                  contentPadding: EdgeInsets.all(2.0),
                  title: (query == "")
                      ? Text(
                          users[index]["Name"],
                          style: GoogleFonts.courgette(
                              fontSize: 16.0, color: Colors.black),
                        )
                      : Text(
                          fliterUsers[index]["Name"],
                          style: GoogleFonts.courgette(
                              fontSize: 16.0, color: Colors.black),
                        ),
                  subtitle: (query == "")
                      ? Text(
                          users[index]["SubName"],
                          style: GoogleFonts.courgette(
                              fontSize: 16.0, color: Colors.black),
                        )
                      : Text(
                          fliterUsers[index]["SubName"],
                          style: GoogleFonts.courgette(
                              fontSize: 16.0, color: Colors.black),
                        ),
                  leading: CircleAvatar(
                    radius: 30.0,
                    backgroundImage: NetworkImage(imagesOfDoctros[index]),
                    backgroundColor: Color(0XFFF9DB5B2),
                  )),
            ),
          );
        },
      ),
    );
  }
}
