import 'package:flutter/material.dart';
import 'package:poll_dao/src/core/colors/app_colors.dart';
import 'package:poll_dao/src/core/extentions/extentions.dart';
import 'package:poll_dao/src/features/discover_page/presentation/widgets/options_select.dart';
import 'package:poll_dao/src/features/discover_page/presentation/widgets/voice_date.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
class BuildButton extends StatefulWidget {
  const BuildButton({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  State<BuildButton> createState() => _BuildButtonState();
}

class _BuildButtonState extends State<BuildButton> {
  @override
  Widget build(BuildContext context) {
    bool isSelected = true;
    return ZoomTapAnimation(
      onTap: widget.onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20).copyWith(bottom: 20),
        child: Container(
            decoration: BoxDecoration(
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
                    "What cake flavor would be best for my boyfriend's birthday celebration?",
                    style:
                        TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: AppColors.black),
                  ),
                  20.ph,
                  OptionsSelect(
                    onTap: () {
                      isSelected = !isSelected;
                      setState(() {});
                    },
                    textOne: "A",
                    textTwo: "A rich chocolate cake",
                  ),
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
    );
  }
}
