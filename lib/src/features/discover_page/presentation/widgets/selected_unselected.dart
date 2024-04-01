import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:poll_dao/src/core/icons/app_icons.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../../core/colors/app_colors.dart';

class SelectedUnselected extends StatefulWidget {
  final bool isSelected;
  final VoidCallback onTap;
  const SelectedUnselected({super.key, required this.isSelected, required this.onTap});

  @override
  State<SelectedUnselected> createState() => _SelectedUnselectedState();
}

class _SelectedUnselectedState extends State<SelectedUnselected> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return ZoomTapAnimation(
      onTap: widget.onTap,
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            25,
          ),
          color: widget.isSelected ? AppColors.white : AppColors.c_5856D6,
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: SvgPicture.asset(
              widget.isSelected ? AppImages.unSelectedLike : AppImages.selectedLike),
        ),
      ),
    );
  }
}
