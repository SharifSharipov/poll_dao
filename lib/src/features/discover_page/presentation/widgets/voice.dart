import 'package:flutter/material.dart';
import 'package:poll_dao/src/core/colors/app_colors.dart';
import 'package:poll_dao/src/core/extentions/extentions.dart';
import 'package:poll_dao/src/features/discover_page/presentation/widgets/image_select.dart';
import 'package:poll_dao/src/features/discover_page/presentation/widgets/voice_date.dart';

import '../../../../core/icons/app_icons.dart';

class Voice extends StatefulWidget {
  const Voice({super.key});

  @override
  State<Voice> createState() => _VoiceState();
}

class _VoiceState extends State<Voice> {
  bool isSelected1 = true;
  bool isSelected2 = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(bottom: 20),
      child: Container(
        decoration: BoxDecoration(
          /*boxShadow: const [
            BoxShadow(
                color: AppColors.c_93A2B4,
                blurRadius: 20,
                spreadRadius: 1,
                offset: Offset(0, 0)),
          ],*/
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              VoiceData(
                textOne: 'Lisa Bryant',
                textTwo: '2 days ago',
                nameText: "Ls",
                onTapTwo: () {},
                textThree: 'Last Voted 10 hour ago',
              ),
              const Text(
                "Which of the two flower photos should I share on Instagram?",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: AppColors.black),
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
    );
  }
}
