import 'package:flutter/widgets.dart';
import 'package:poll_dao/src/core/colors/app_colors.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class LocationWidget extends StatefulWidget {
  const LocationWidget({super.key, required this.onTap, required this.text});
  final VoidCallback onTap;
  final String text;

  @override
  State<LocationWidget> createState() => _LocationWidgetState();
}

class _LocationWidgetState extends State<LocationWidget> {
  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: widget.onTap,
      child: Container(
        padding: const EdgeInsets.all(17).copyWith(left: 30),
        color: AppColors.white,
        child: Text(
          widget.text,
          style:
          const TextStyle(color: AppColors.c_111111, fontSize: 17, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}