import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:poll_dao/src/core/colors/app_colors.dart';

class BaseTextField extends StatefulWidget {
  final String hintText;
  final String text;
  final String icon;
  final bool isObscure;
  final TextEditingController? controller;

  const BaseTextField({
    super.key,
    required this.hintText,
    required this.text,
    required this.icon,
    this.isObscure = false,
    this.controller,
  });

  @override
  State<BaseTextField> createState() => _BaseTextFieldState();
}

class _BaseTextFieldState extends State<BaseTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(bottom: 20),
      child: Container(
        padding: const EdgeInsets.all(10).copyWith(left: 20),
        decoration: BoxDecoration(
          color: AppColors.c_F0F3FA,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.white,
              ),
              child: Center(child: SvgPicture.asset(widget.icon)),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Stack(
                children: [
                  Text(
                    widget.text,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w600, color: AppColors.c_5856D6),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: TextField(
                      obscureText: widget.isObscure,
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
          ],
        ),
      ),
    );
  }
}
