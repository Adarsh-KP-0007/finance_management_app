import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:trackizer/common/color_extension.dart';
import 'package:trackizer/common_widget/primary_button.dart';
import 'package:trackizer/common_widget/round_textfield.dart';
import 'package:trackizer/view/add_budget/add_budget_view.dart';
import 'package:trackizer/view/add_subscription/add_subscription_view.dart';
import 'package:trackizer/view/add_expense/add_expense_view.dart';
import 'package:trackizer/common_widget/image_button.dart';

class Expenseorbill extends StatefulWidget {
  const Expenseorbill({super.key});

  @override
  State<Expenseorbill> createState() => _ExpenseorbillState();
}

class _ExpenseorbillState extends State<Expenseorbill> {
  TextEditingController txtDescription = TextEditingController();

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 500,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddExpenseView()),
                  );
                },
                child: Text('EXPENSE'),
              ),
            ),
            SizedBox(height: 50),
            SizedBox(
              width: 500,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddSubScriptionView()),
                  );
                },
                child: Text('SUBSCRIPTION'),
              ),
            ),
            SizedBox(height: 50),
            SizedBox(
              width: 500,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddBudgetView()),
                  );
                },
                child: Text('BUDGETS'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
