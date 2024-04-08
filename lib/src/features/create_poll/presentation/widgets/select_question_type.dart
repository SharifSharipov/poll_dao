import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:poll_dao/src/core/colors/app_colors.dart';
class SelectQuestionWidget extends StatelessWidget {
  const SelectQuestionWidget(
      {super.key, required this.text, required this.data, required this.onTap});
  final String text;
  final List<Widget> data;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheetAction(
        onPressed: onTap,
        isDestructiveAction: true,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: const TextStyle(
                  color: AppColors.c_111111, fontSize: 17, fontWeight: FontWeight.w500),
            ),
            Column(
              children: data,
            ),
          ],
        ));
  }
}
