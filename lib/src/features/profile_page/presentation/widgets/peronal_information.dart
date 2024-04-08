import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:poll_dao/src/core/colors/app_colors.dart';
import 'package:poll_dao/src/core/extentions/extentions.dart';
import 'package:poll_dao/src/core/icons/app_icons.dart';
class PersonData extends StatefulWidget {
  const PersonData(
      {super.key,
      required this.onTap,
      required this.textOne,
      required this.textTwo,
      required this.icon});
  final VoidCallback onTap;
  final String textOne;
  final String textTwo;
  final String icon;
  @override
  State<PersonData> createState() => _PersonDataState();
}

class _PersonDataState extends State<PersonData> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(bottom: 20),
      child: Container(
        padding: const EdgeInsets.all(17),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.c_F0F3FA,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.white,
                  ),
                  child: Center(
                      child: SvgPicture.asset(
                    widget.icon,
                    width: 24,
                    height: 24,
                  )),
                ),
                20.pw,
                Column(
                  children: [
                    RichText(
                      text: TextSpan(
                        text: widget.textOne,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600, color: AppColors.c_5856D6),
                        children: <TextSpan>[
                          TextSpan(
                            text: " \n${widget.textTwo}",
                            style: const TextStyle(
                              color: AppColors.c_A0A4A7,
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            IconButton(
                onPressed: widget.onTap,
                icon: SvgPicture.asset(
                  AppImages.lowIosButton,
                  height: 24,
                  width: 24,
                ))
          ],
        ),
      ),
    );
  }
}
