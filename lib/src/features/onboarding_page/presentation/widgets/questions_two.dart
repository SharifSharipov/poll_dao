import 'package:flutter/cupertino.dart';
import 'package:poll_dao/src/core/extentions/extentions.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../../core/colors/app_colors.dart';
import '../../../../core/icons/app_icons.dart';

class QuestionsTwo extends StatefulWidget {
  const QuestionsTwo({super.key});

  @override
  State<QuestionsTwo> createState() => _QuestionsTwoState();
}

class _QuestionsTwoState extends State<QuestionsTwo> {
  @override
  Widget build(BuildContext context) {
    bool isSelected = true;
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Image.asset("assets/images/hexagon.png"),
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
                      "Which of the two flower photos should I share on Instagram?",
                      style: TextStyle(
                          fontSize: 17, fontWeight: FontWeight.bold, color: AppColors.black),
                    ),
                    10.ph,
                    Row(
                      children: [
                        ZoomTapAnimation(
                            onTap: () {},
                            child: Image.asset(
                              AppImages.sunflower,
                              height: 129,
                              width: 175,
                            )),
                        ZoomTapAnimation(
                            onTap: () {},
                            child: Image.asset(
                              AppImages.flowers,
                              height: 129,
                              width: 175,
                            )),
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
              )),
        ),
      ],
    );
  }
}
