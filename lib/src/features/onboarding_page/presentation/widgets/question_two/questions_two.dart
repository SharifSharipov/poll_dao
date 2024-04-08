import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:poll_dao/src/core/extentions/extentions.dart';
import 'package:poll_dao/src/features/onboarding_page/presentation/widgets/question_two/vote_last.dart';
import '../../../../../core/colors/app_colors.dart';
import '../../../../../core/icons/app_icons.dart';
import 'image_select.dart';

class QuestionsTwo extends StatefulWidget {
  const QuestionsTwo({super.key});

  @override
  State<QuestionsTwo> createState() => _QuestionsTwoState();
}

class _QuestionsTwoState extends State<QuestionsTwo> {
  bool isSelected1 = true;
  bool isSelected2 = true;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Image.asset("assets/images/hexagon.png"),
            )),
            Padding(
          padding: EdgeInsets.only(
            left: width * 0.4,
            right: width * 0.05,
          ),
          child:const VoteLast(textOne: 'Than Wuhan ', textTwo: '1 week ago', iconOne: AppImages.variationsOne, iconTwo: AppImages.sunflower,),
        ),
        10.ph,
        Padding(
          padding: const EdgeInsets.only(top: 80, left: 20, right: 20),
          child: Container(
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
                    "Which of the two flower photos should I share on Instagram?",
                    style: TextStyle(
                        fontSize: 17, fontWeight: FontWeight.bold, color: AppColors.black),
                  ),
                  10.ph,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ImageSelect(
                          isSelected: isSelected1,
                          onTap: () {
                            isSelected1 = !isSelected1;
                            setState(() {});
                          },
                          icon: AppImages.sunflower),
                      ImageSelect(
                          isSelected: isSelected2,
                          onTap: () {
                            isSelected2 = !isSelected2;
                            setState(() {});
                          },
                          icon: AppImages.flowers)
                    ],
                  ),
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
            ),
          ),
        ),
        /* Padding(
          padding: EdgeInsets.only(
            left: width * 0.15,
            right: width * 0.25,
            top: width * 0.85,
          ),
          child: const VotedLast(
            textOne: 'Tan Wuhan',
            textTwo: '1 Wek ago ',
            iconOne: AppImages.person,
            iconTwo: AppImages.add,
          ),
        ),*/
      ],
    );
  }
}
