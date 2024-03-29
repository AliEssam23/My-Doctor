// ignore_for_file: file_names, unused_import, non_constant_identifier_names, avoid_function_literals_in_foreach_calls, use_full_hex_values_for_flutter_colors, prefer_const_constructors, duplicate_ignore, prefer_const_literals_to_create_immutables, null_check_always_fails, avoid_unnecessary_containers, avoid_print

import 'package:application_team/logToHomePage/logToPage1.dart';
import 'package:application_team/logToHomePage/pageOfSplashScreen1.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
// ignore: duplicate_import
import 'logToPage1.dart';

// var NameOfCategorie=NameOfCategories;
List urlOfImagesOfCategories = [
  """https://m.media-amazon.com/images/I/61A2Cds084L._SL1391_.jpg""",
  """https://upload.wikimedia.org/wikipedia/commons/1/13/Human_skin_structure.jpg""",
  """https://cdn.mos.cms.futurecdn.net/NvekX9tT7peSEUHRersaT8-1200-80.jpg""",
  """https://media.istockphoto.com/id/912441172/vector/white-tooth-flat-design.jpg?s=612x612&w=0&k=20&c=PFewSZREEZrm-TMiGFLEhnOwaNmJT9GOS5YshiXZbnE=""",
  """https://www.northtexassmiles.com/wp-content/uploads/2019/01/Depositphotos_71806761_xl-2015-2.jpg""",
  """http://www.todaysparent.com/wp-content/uploads/2014/12/blanket-baby-article.jpg""",
];

// ignore: use_key_in_widget_constructors
class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//   CollectionReference usersref =
// FirebaseFirestore.instance.collection("Categories");

//   getData() async {
//     var responsebody = await usersref.get();
//     responsebody.docs.forEach((element) {
//       setState(() {
//         if (element!=null) {
//             NameOfCategories.add(element);

//         }

//       });

//     });
//   }
/////////////////////////////////////////////////////////
  ///
  ///if user log in  in application retrun true
  ///
  ///
  getDataOfUser() {
    var user = FirebaseAuth.instance.currentUser;

    print("============================");
    print(user!.email);
  }

//////////////////////////////////////////////////////////
  @override
  void initState() {
    // getData();

    getDataOfUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFF9DB5B2),
      extendBodyBehindAppBar: true,
      ///////////////////////////////////////////////////////////////////
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
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
      ////////////////////////////////////////////////////////
      body: Container(
        child: CustomScrollView(
          slivers: <Widget>[
            // ignore: prefer_const_constructors
            SliverAppBar(
              pinned: false,
              snap: false,
              floating: false,
              backgroundColor: Color(0XFFF9DB5B2),
              expandedHeight: 100.0,
              automaticallyImplyLeading: false,
              flexibleSpace: FlexibleSpaceBar(
                title: Text("""Categories""",
                    style: GoogleFonts.courgette(
                        fontSize: 28.0, color: Colors.black)),
                centerTitle: true,
                stretchModes: [
                  StretchMode.zoomBackground,
                  StretchMode.blurBackground,
                  StretchMode.fadeTitle,
                ],
                background: Image(
                  image: AssetImage("images/image2.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  /////////////////////////////////////////////////////////////////
                  return (NameOfCategories[index]["Name"] != null)
                      ? Column(
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
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) {
                                    return PageViewDoctors(
                                      Name: NameOfCategories[index]["Name"],
                                      urlOfCategorie:
                                          urlOfImagesOfCategories[index],
                                    );
                                  }));
                                },
                                child: ListTile(
                                    contentPadding: EdgeInsets.all(10.0),
                                    title: Text(
                                      NameOfCategories[index]["Name"],
                                      style: GoogleFonts.courgette(
                                          fontSize: 16.0, color: Colors.black),
                                    ),
                                    leading: CircleAvatar(
                                      radius: 30.0,
                                      backgroundImage: NetworkImage(
                                          urlOfImagesOfCategories[index]),
                                      backgroundColor: Color(0XFFF9DB5B2),
                                    )),
                              ),
                            )
                          ],
                        )
                      : null;
                },
                ///////////////////////////////////////////////////////////////////
                childCount: NumberOfDataOfCategoriesFormFirebase,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/////////////////////////////////////////////////////////////////////
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
        NameOfCategories.where((element) => element["Name"].contains(query))
            .toList();

    return Container(
      color: Color(0XFFF9DB5B2),
      child: ListView.builder(
        itemCount: (query == "")
            ? NumberOfDataOfCategoriesFormFirebase
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
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return PageViewDoctors(
                    Name: (query == "")
                        ? NameOfCategories[index]["Name"]
                        : fliterUsers[index]["Name"],
                    urlOfCategorie: urlOfImagesOfCategories[index],
                  );
                }));
              },
              child: ListTile(
                  contentPadding: EdgeInsets.all(10.0),
                  title: (query == "")
                      ? Text(
                          NameOfCategories[index]["Name"],
                          style: GoogleFonts.courgette(
                              fontSize: 16.0, color: Colors.black),
                        )
                      : Text(
                          fliterUsers[index]["Name"],
                          style: GoogleFonts.courgette(
                              fontSize: 16.0, color: Colors.black),
                        ),
                  leading: CircleAvatar(
                    radius: 30.0,
                    backgroundImage:
                        NetworkImage(urlOfImagesOfCategories[index]),
                    backgroundColor: Color(0XFFF9DB5B2),
                  )),
            ),
          );
        },
      ),
    );
  }
}
//////////////////////////////////////////////////////////////