import 'package:flutter/material.dart';
import 'package:poll_dao/src/core/colors/app_colors.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class SelectsItemWidget extends StatelessWidget {
  const SelectsItemWidget({super.key, required this.onTap, required this.text, this.isChosen = false});
  final VoidCallback onTap;
  final String text;
  final bool isChosen;

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(17).copyWith(left: 20),
        child: Row(
          children: [
            isChosen ? const Icon(Icons.check) : const SizedBox(width: 24),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                text,
                style: const TextStyle(color: AppColors.c_111111, fontSize: 17, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
