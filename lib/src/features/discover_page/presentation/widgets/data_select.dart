import 'package:flutter/material.dart';
import 'package:poll_dao/src/core/colors/app_colors.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
class DataSelect extends StatelessWidget {
  const DataSelect({super.key, required this.onTap, required this.text});
  final VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(bottom: 20),
      child: ZoomTapAnimation(
          onTap: onTap,
          child: Card(
            color: AppColors.c_A0A4A7,
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Center(
                child: Text(
                  text,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w600, color: AppColors.black),
                ),
              ),
            ),
          )),
    );
  }
}
