import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:poll_dao/src/core/colors/app_colors.dart';
import 'package:poll_dao/src/core/extentions/extentions.dart';

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
      child: Container(
         height:116,
        decoration: BoxDecoration(
          color: AppColors.c_5856D6.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(13),
                  child: SvgPicture.asset(icon),
                ),
              ),
              20.pw,
              Expanded(
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Column(
                    children: [
                         Padding(
                          padding:const EdgeInsets.only(top: 10),
                           child: Align(
                             alignment: Alignment.topLeft,
                             child: Text(textOne,style:const TextStyle(
                                color: AppColors.c_5856D6,
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                              ) ,),
                           ),
                         ),
                      TextField(
                        maxLines: 1,
                        controller: controller,
                        style: const TextStyle(color: AppColors.secondary, fontSize: 24),
                        decoration:InputDecoration(
                          border: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder:const OutlineInputBorder(
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
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}
