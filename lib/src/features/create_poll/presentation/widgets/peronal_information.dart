import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:poll_dao/src/core/colors/app_colors.dart';
import 'package:poll_dao/src/core/extentions/extentions.dart';
import 'package:poll_dao/src/core/icons/app_icons.dart';
import 'package:poll_dao/src/features/create_poll/presentation/widgets/text_widget.dart';
class PersonalInformation extends StatefulWidget {
  const PersonalInformation(
      {super.key, required this.onTap, required this.textOne, required this.textTwo});
  final VoidCallback onTap;
  final String textOne;
  final String textTwo;
  @override
  State<PersonalInformation> createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformation> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
            alignment: Alignment.centerLeft,
            child: customTextWidget(text: widget.textOne, color: AppColors.black)),
        15.ph,
        Container(
          padding: const EdgeInsets.all(17),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.textTwo,
                style: const TextStyle(
                    fontSize: 17, fontWeight: FontWeight.w600, color: AppColors.c_111111),
              ),
              IconButton(onPressed: widget.onTap, icon: SvgPicture.asset(AppImages.lowIosButton,height: 24,width: 24,))
            ],
          ),
        ),
      ],
    );
  }
}
