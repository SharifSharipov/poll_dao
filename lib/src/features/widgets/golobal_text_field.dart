import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:poll_dao/src/core/colors/app_colors.dart';
class RegisterTextField extends StatelessWidget {
  final TextEditingController controller;
  final String textOne;
  final String textTwo;
  final String icon;
  const RegisterTextField({
    Key? key,
    required this.controller,
    required this.textOne,
    required this.textTwo,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(bottom: 20),
      child: TextField(
        maxLines: 1,
        controller: controller,
        style: const TextStyle(color: AppColors.secondary, fontSize: 24),
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(12)),

          ),
          prefixIcon: SvgPicture.asset(icon),
          labelText: textOne,
          labelStyle: const TextStyle(
            color: AppColors.c_A0A4A7,
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
          filled: true,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          //fillColor: Colors.red,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          hintText: textTwo,
          hintStyle: const TextStyle(
            color: AppColors.c_A0A4A7,
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
