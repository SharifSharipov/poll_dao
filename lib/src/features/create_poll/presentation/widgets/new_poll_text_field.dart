import 'package:flutter/material.dart';
import 'package:poll_dao/src/core/colors/app_colors.dart';

class BaseNewPollTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  const BaseNewPollTextField({super.key, required this.hintText, required this.controller});

  @override
  State<BaseNewPollTextField> createState() => _BaseNewPollTextFieldState();
}

class _BaseNewPollTextFieldState extends State<BaseNewPollTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(bottom: 30),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: AppColors.white),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: widget.controller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: widget.hintText,
                  hintStyle: const TextStyle(
                    color: AppColors.c_A0A4A7,
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
