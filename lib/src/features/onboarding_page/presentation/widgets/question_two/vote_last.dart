import 'package:flutter/material.dart';
import '../../../../../core/colors/app_colors.dart';

class VoteLast extends StatelessWidget {
  final String iconOne;
  final String iconTwo;
  final String textOne;
  final String textTwo;
  const VoteLast(
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.asset(
                iconOne,
              ),
            ) ,
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
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.asset(
                iconTwo,
                height: 20,
                width: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
