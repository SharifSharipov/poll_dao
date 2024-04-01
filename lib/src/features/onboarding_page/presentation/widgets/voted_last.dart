import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:poll_dao/src/core/colors/app_colors.dart';
class VotedLast extends StatelessWidget {
  final String textOne;
  final String textTwo;
  final String iconOne;
  final String iconTwo;
  const VotedLast(
      {super.key,
      required this.textOne,
      required this.textTwo,
      required this.iconOne,
      required this.iconTwo});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
              color: AppColors.c_93A2B4, blurRadius: 20, spreadRadius: 1, offset: Offset(0, 0)),
        ],
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SvgPicture.asset(iconOne,height: 20,width: 20,),
            Column(
              children: [
                Text(
                  textOne,
                  style: const TextStyle(color: AppColors.c_93A2B4),
                ),
                Text(
                  textTwo,
                  style: const TextStyle(color: AppColors.c_93A2B4),
                ),
              ],
            ),
            SvgPicture.asset(iconTwo,height: 20,width: 20,),
          ],
        ),
      ),
    );
  }
}
