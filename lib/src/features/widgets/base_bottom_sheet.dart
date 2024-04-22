import 'package:flutter/material.dart';

class BaseBottomSheet extends StatefulWidget {
  const BaseBottomSheet({
    super.key,
    required this.height,
    required this.child,
    required this.backgroundColor,
    this.scaleFactor = 0.9,
  });
  final CustomScrollView child;
  final double height;
  final Color backgroundColor;
  final double scaleFactor;

  @override
  State<BaseBottomSheet> createState() => _BaseBottomSheetState();
}

class _BaseBottomSheetState extends State<BaseBottomSheet> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: widget.height * widget.scaleFactor,
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(20),
          ),
          color: widget.backgroundColor,
        ),
        child: widget.child);
  }
}
