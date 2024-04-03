import 'package:flutter/material.dart';

class BaseBottomSheet extends StatefulWidget {
  const BaseBottomSheet({
    Key? key,
    required this.height,
    required this.child,
  }) : super(key: key);
  final CustomScrollView child;
  final double height;

  @override
  State<BaseBottomSheet> createState() => _BaseBottomSheetState();
}

class _BaseBottomSheetState extends State<BaseBottomSheet> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height * 0.9,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(20),
        ),
        color: Theme.of(context).canvasColor,
      ),
      child: widget.child
    );
  }
}
