import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class GlobalButton extends StatelessWidget {
  const GlobalButton(
      {super.key,
      required this.onTap,
      required this.data,
      required this.color,
      this.border
      });
  final VoidCallback onTap;
  final Row data;
  final Color color;
  final Border? border;

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: () {},
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 18),
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(20),
            border:border
          ),

          child:  data,
          )
    );
  }
}
