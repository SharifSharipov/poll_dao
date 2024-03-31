import 'package:flutter/material.dart';

class BaseContainer extends StatelessWidget {
  final Widget child;
  final double? width;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final double radius;
  final Color color;
  const BaseContainer(
      {super.key,
      required this.child,
      this.width,
      this.margin,
      required this.radius,
      required this.color,
      this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: padding,
      margin: margin, //
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(radius)),
      child: child,
    );
  }
}
