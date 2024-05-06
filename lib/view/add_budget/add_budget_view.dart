import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:trackizer/common/color_extension.dart';
import 'package:trackizer/common_widget/primary_button.dart';
import 'package:trackizer/common_widget/round_textfield.dart';

import '../../common_widget/image_button.dart';

class AddBudgetView extends StatefulWidget {
  const AddBudgetView({super.key});

  @override
  State<AddBudgetView> createState() => _AddBudgetViewState();
}

class _AddBudgetViewState extends State<AddBudgetView> {
  TextEditingController txtDescription = TextEditingController();

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
                child: RoundTextField(
                  title: "Category",
                  titleAlign: TextAlign.center,
                  controller: txtDescription,
                )),
            Padding(
                padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
                child: RoundTextField(
                  title: "Description",
                  titleAlign: TextAlign.center,
                  controller: txtDescription,
                )),
            Padding(
                padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
                child: RoundTextField(
                  title: "Budget Goal",
                  titleAlign: TextAlign.center,
                  controller: txtDescription,
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: PrimaryButton(title: "Start saving!", onPressed: () {}),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
