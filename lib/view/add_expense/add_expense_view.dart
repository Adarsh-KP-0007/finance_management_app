import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:trackizer/common/color_extension.dart';
import 'package:trackizer/common_widget/primary_button.dart';
import 'package:trackizer/common_widget/round_textfield.dart';

import '../../common_widget/image_button.dart';

class AddExpenseView extends StatefulWidget {
  const AddExpenseView({super.key});

  @override
  State<AddExpenseView> createState() => _AddExpenseViewState();
}

class _AddExpenseViewState extends State<AddExpenseView> {
  TextEditingController txtDescription = TextEditingController();
  TextEditingController txtExpense = TextEditingController();
  TextEditingController txtCategory = TextEditingController();

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

  double amountVal = 0.09;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: TColor.gray,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
                
                child: TextField(
                style:
                    TextStyle(color: const Color.fromARGB(255, 255, 255, 255)),
                decoration: InputDecoration(
                  labelText: 'Username',
                  labelStyle: TextStyle(color: Colors.white),
                ),
                /*RoundTextField(

                  title: "Category",
                  titleAlign: TextAlign.center,*/
                  controller: txtCategory,
                )),
            Padding(
                padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
                child: TextField(
                style:
                    TextStyle(color: const Color.fromARGB(255, 255, 255, 255)),
                decoration: InputDecoration(
                  labelText: 'Description',
                  labelStyle: TextStyle(color: Colors.white),
                ),
                /*RoundTextField(
                  title: "Description",
                  titleAlign: TextAlign.center,*/
                  controller: txtDescription,
                )),
            Padding(
                padding: const EdgeInsets.only(top: 30, left: 20, right: 20), 
                child: TextField(
                style:
                    TextStyle(color: const Color.fromARGB(255, 255, 255, 255)),
                decoration: InputDecoration(
                  labelText: 'Expense',
                  labelStyle: TextStyle(color: Colors.white),
                ),/*RoundTextField(
                  title: "Expense",
                  titleAlign: TextAlign.center,*/
                  controller: txtExpense,
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: PrimaryButton(
                  title: "Add this Expense",
                  onPressed: () => _addexpense(context)),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  void _addexpense(context) async {
    // Your text input
    int parsedInteger;
    try {
      parsedInteger = int.parse(txtExpense.text);

      var db = FirebaseFirestore.instance;
      final subdata = <String, dynamic>{
        "category": txtCategory.text,
        "expense": parsedInteger,
        "mail": "",
      };

      db.collection("transaction").add(subdata).then((DocumentReference doc) =>
          print('DocumentSnapshot added with ID: ${doc.id}'));
    } catch (e) {
      print("Error");
    }
    Navigator.pop(context);
    Navigator.pop(context);
    setState(() {});
  }
}
