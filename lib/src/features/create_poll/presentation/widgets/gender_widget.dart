import 'package:flutter/material.dart';
import 'package:poll_dao/src/core/colors/app_colors.dart';
import 'package:poll_dao/src/core/extentions/extentions.dart';
import 'package:poll_dao/src/features/create_poll/presentation/widgets/gender_select_widget.dart';

class Gender extends StatefulWidget {
  const Gender(
      {super.key,
      required this.onTapOne,
      required this.onTapTwo,
      required this.onTapThree,
      required this.onTapFour,
      required this.isSelectedOne,
      required this.isSelectedTwo,
      required this.isSelectedThree,
      required this.isSelectedFour});
  final VoidCallback onTapOne;
  final VoidCallback onTapTwo;
  final VoidCallback onTapThree;
  final VoidCallback onTapFour;
  final bool isSelectedOne;
  final bool isSelectedTwo;
  final bool isSelectedThree;
  final bool isSelectedFour;
  @override
  State<Gender> createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: AppColors.white),
      child: Column(
        children: [
          Row(
            children: [
              GenderSelect(onTap: widget.onTapOne, isSelected: widget.isSelectedOne),
              20.pw,
              const Text(
                "All",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                    color: AppColors.c_111111,
                    letterSpacing: 0.3),
              )
            ],
          ),
          15.ph,
          Row(
            children: [
              GenderSelect(onTap: widget.onTapTwo, isSelected: widget.isSelectedTwo),
              20.pw,
              const Text(
                "Men",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                    color: AppColors.c_111111,
                    letterSpacing: 0.3),
              )
            ],
          ),
          15.ph,
          Row(
            children: [
              GenderSelect(onTap: widget.onTapThree, isSelected: widget.isSelectedThree),
              20.pw,
              const Text(
                "Women",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                    color: AppColors.c_111111,
                    letterSpacing: 0.3),
              )
            ],
          ),
          15.ph,
          Row(
            children: [
              GenderSelect(onTap: widget.onTapFour, isSelected: widget.isSelectedFour),
              20.pw,
              const Text(
                "Other",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                    color: AppColors.c_111111,
                    letterSpacing: 0.3),
              )
            ],
          ),
        ],
      ),
    );
  }
}
