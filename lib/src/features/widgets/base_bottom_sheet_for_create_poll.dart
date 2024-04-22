import 'package:flutter/material.dart';

class BaseBottomSheetForCreatePoll extends StatelessWidget {
  const BaseBottomSheetForCreatePoll({
    super.key,
    required this.height,
    required this.child,
    required this.backgroundColor,
  });
  final Widget child;
  final double height;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
        clipBehavior: Clip.hardEdge,
        height: height * 0.9,
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          color: backgroundColor,
        ),
        child: child);
  }
}
