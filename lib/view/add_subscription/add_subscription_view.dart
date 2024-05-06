import 'dart:js';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:trackizer/common/color_extension.dart';
import 'package:trackizer/common_widget/primary_button.dart';
import 'package:trackizer/common_widget/round_textfield.dart';
import 'package:trackizer/view/main_tab/main_tab_view.dart';

import '../../common_widget/image_button.dart';

class AddSubScriptionView extends StatefulWidget {
  const AddSubScriptionView({super.key});

  @override
  State<AddSubScriptionView> createState() => _AddSubScriptionViewState();
}

class _AddSubScriptionViewState extends State<AddSubScriptionView> {
  TextEditingController txtDescription = TextEditingController();
  TextEditingController txtMonthlyPrice = TextEditingController();

  List subArr = [
    {"name": "HBO GO", "icon": "assets/img/hbo_logo.png"},
    {"name": "Spotify", "icon": "assets/img/spotify_logo.png"},
    {"name": "YouTube Premium", "icon": "assets/img/youtube_logo.png"},
    {
      "name": "Microsoft OneDrive",
      "icon": "assets/img/onedrive_logo.png",
    },
    {"name": "NetFlix", "icon": "assets/img/netflix_logo.png"}
  ];
  DateTime todayDate = DateTime.now();
  double amountVal = 0.09;
  String sObjName = 'NULL';
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: TColor.gray,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: TColor.gray70.withOpacity(0.5),
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25))),
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Image.asset("assets/img/back.png",
                                    width: 25,
                                    height: 25,
                                    color: TColor.gray30))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "New",
                              style:
                                  TextStyle(color: TColor.gray30, fontSize: 16),
                            )
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        "Add new\n subscription",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: TColor.white,
                            fontSize: 40,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(
                      width: media.width,
                      height: media.width * 0.6,
                      child: CarouselSlider.builder(
                        options: CarouselOptions(
                          autoPlay: false,
                          aspectRatio: 1,
                          enlargeCenterPage: true,
                          enableInfiniteScroll: true,
                          viewportFraction: 0.65,
                          enlargeFactor: 0.4,
                          enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                        ),
                        itemCount: subArr.length,
                        itemBuilder: (BuildContext context1, int itemIndex,
                            int pageViewIndex) {
                          var sObj = subArr[itemIndex] as Map? ?? {};
                          sObjName = sObj["name"];
                          return Container(
                            margin: const EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  sObj["icon"],
                                  width: media.width * 0.4,
                                  height: media.width * 0.4,
                                  fit: BoxFit.fitHeight,
                                ),
                                const Spacer(),
                                Text(
                                  sObj["name"],
                                  style: TextStyle(
                                      color: TColor.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
                child: RoundTextField(
                  title: "Description",
                  titleAlign: TextAlign.center,
                  controller: txtDescription,
                )),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              child: Column(
                children: [
                  Text(
                    "Monthly price",
                    style: TextStyle(
                        color: TColor.gray40,
                        fontSize: 12,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  TextField(
                    style: TextStyle(
                        color: TColor.white,
                        fontSize: 40,
                        fontWeight: FontWeight.w700),
                    controller: txtMonthlyPrice,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    width: 150,
                    height: 1,
                    color: TColor.gray70,
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: PrimaryButton(
                title: "Add this platform",
                onPressed: () => _addsub(context, sObjName),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  void _addsub(context, String sObjName) async {
    // Your text input
    int parsedInteger;
    try {
      parsedInteger = int.parse(txtMonthlyPrice.text);

      var db = FirebaseFirestore.instance;
      final subdata = <String, dynamic>{
        "subscriptionType": sObjName,
        "Monthlyprice": parsedInteger,
        "Date": todayDate
      };

      db.collection("subscription").add(subdata).then((DocumentReference doc) =>
          print('DocumentSnapshot added with ID: ${doc.id}'));
    } catch (e) {
      print("Error");
    }
    Navigator.pop(context);
    Navigator.pop(context);
  }
}
