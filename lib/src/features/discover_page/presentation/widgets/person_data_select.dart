import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:poll_dao/src/core/colors/app_colors.dart';
import 'package:poll_dao/src/core/icons/app_icons.dart';

class PersonData extends StatefulWidget {
  const PersonData({
    super.key,
    required this.textOne,
    required this.textTwo,
    required this.icon,
    required this.columnData,
  });
  final String textOne;
  final String textTwo;
  final String icon;
  final List<Widget> columnData;
  @override
  State<PersonData> createState() => _PersonDataState();
}

class _PersonDataState extends State<PersonData> {
  bool isAccordionOpen = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(bottom: 20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.c_F0F3FA,
        ),
        child: ExpansionTile(
          shape: RoundedRectangleBorder(
            side: BorderSide.none,
            borderRadius: BorderRadius.circular(12),
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          maintainState: true,
          enableFeedback: true,
          backgroundColor: AppColors.c_F0F3FA,
          leading: Container(
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
          title: Text(
            widget.textOne,
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.w600, color: AppColors.c_5856D6),
          ),
          subtitle: Text(
            widget.textTwo,
            style: const TextStyle(
              color: AppColors.c_A0A4A7,
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
          trailing: isAccordionOpen
              ? RotatedBox(
                  quarterTurns: 1,
                  child: SvgPicture.asset(
                    AppImages.arrowBackIosRight,
                    height: 24,
                    width: 24,
                  ))
              : SvgPicture.asset(
                  AppImages.arrowBackIosRight,
                  height: 24,
                  width: 24,
                ),
          children: widget.columnData,
          onExpansionChanged: (bool expanded) {
            setState(() {
              isAccordionOpen = expanded;
            });
          },
        ),
      ),
    );
  }
}
