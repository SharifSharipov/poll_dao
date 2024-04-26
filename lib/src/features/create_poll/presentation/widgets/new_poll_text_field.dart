import 'package:flutter/material.dart';
import 'package:poll_dao/src/core/colors/app_colors.dart';
import 'package:poll_dao/src/core/extentions/extentions.dart';
import 'package:poll_dao/src/features/topics/presentation/select_topic_widget.dart';

class BaseNewPollTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final bool isValidated;
  const BaseNewPollTextField({
    super.key,
    required this.hintText,
    this.controller,
    this.onChanged,
    this.isValidated = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 46,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: AppColors.white),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: onChanged,
                    controller: controller,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(top: 0),
                      border: InputBorder.none,
                      hintText: hintText,
                      hintStyle: const TextStyle(color: AppColors.c_A0A4A7, fontWeight: FontWeight.w500, fontSize: 17),
                    ),
                  ),
                ),
              ],
            ),
          ),
          10.ph,
          if (!isValidated) const ValidationErrorText(text: 'Title is required'),
        ],
      ),
    );
  }
}
