import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:poll_dao/src/core/colors/app_colors.dart';
import 'package:poll_dao/src/core/extentions/extentions.dart';
import 'package:poll_dao/src/core/icons/app_icons.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class AddOptions extends StatefulWidget {
  const AddOptions({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  State<AddOptions> createState() => _AddOptionsState();
}

class _AddOptionsState extends State<AddOptions> {
  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: widget.onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10).copyWith(left: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.white,
          ),
          child: Row(
            children: [
              SvgPicture.asset(AppImages.addIcon),
              15.pw,
              const Text(
                "Add New",
                style: TextStyle(
                    color: AppColors.c_5856D6,
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
