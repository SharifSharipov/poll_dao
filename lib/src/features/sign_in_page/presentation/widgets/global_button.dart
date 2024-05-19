import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class GlobalButton extends StatelessWidget {
  const GlobalButton({
    super.key,
    required this.onTap,
    required this.data,
    required this.color,
    this.border,
    this.padding,
    this.cornerRadius,
  });

  final VoidCallback onTap;
  final Row data;
  final Color color;
  final Border? border;
  final EdgeInsets? padding;
  final double? cornerRadius;

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: onTap,
      child: Container(
        padding: padding ?? const EdgeInsets.symmetric(vertical: 18),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(cornerRadius ?? 20),
          border: border,
        ),
        child: data,
      ),
    );
  }
}
