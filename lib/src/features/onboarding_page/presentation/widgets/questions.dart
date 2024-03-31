import 'package:flutter/cupertino.dart';
import 'package:poll_dao/src/core/extentions/extentions.dart';

import '../../../../core/colors/app_colors.dart';
import '../../../../core/icons/app_icons.dart';
import 'options_select.dart';

class QuestionsOne extends StatefulWidget {
  const QuestionsOne({super.key});

  @override
  State<QuestionsOne> createState() => _QuestionsOneState();
}

class _QuestionsOneState extends State<QuestionsOne> {
  @override
  Widget build(BuildContext context) {
    bool isSelected = true;
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Image.asset(AppImages.oval),
        ),
        30.ph,
        Padding(
          padding: const EdgeInsets.only(top: 45, left: 20, right: 20),
          child: Container(
              height: 270,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                      color: AppColors.c_93A2B4,
                      blurRadius: 20,
                      spreadRadius: 1,
                      offset: Offset(0, 0)),
                ],
                color: AppColors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const Text(
                      "What cake flavor would be best for my boyfriend's birthday celebration?",
                      style: TextStyle(
                          fontSize: 17, fontWeight: FontWeight.bold, color: AppColors.black),
                    ),
                    20.ph,
                    OptionsSelect(
                        onTap: () {
                          isSelected = !isSelected;
                          setState(() {});
                        },
                        textOne: "A",
                        textTwo: "A rich chocolate cake",),
                    20.ph,
                    OptionsSelect(
                        onTap: () {
                          isSelected = !isSelected;
                          setState(() {});
                        },
                        textOne: "B",
                        textTwo: "A tangy lemon cheesecake"),
                    20.ph,
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "23 total votes",
                        style: TextStyle(color: AppColors.c_93A2B4),
                      ),
                    )
                  ],
                ),
              )),
        ),
      ],
    );
  }
}
