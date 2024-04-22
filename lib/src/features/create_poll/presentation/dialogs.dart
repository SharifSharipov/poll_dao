import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:poll_dao/src/core/colors/app_colors.dart';
import 'package:poll_dao/src/core/extentions/extentions.dart';
import 'package:poll_dao/src/core/icons/app_icons.dart';
import 'package:poll_dao/src/features/create_poll/data/enum.dart';
import 'package:poll_dao/src/features/create_poll/presentation/widgets/select_question_type.dart';

Future<OptionsType?> showDropDown(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Center(
          child: CupertinoActionSheet(
            actions: [
              0.1.ph,
              SelectQuestionWidget(
                text: "Text",
                data: const [
                  Text(
                    "Aa",
                    style: TextStyle(
                      color: AppColors.c_111111,
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
                onTap: () => Navigator.pop(context, OptionsType.text),
              ),
              0.1.ph,
              SelectQuestionWidget(
                text: "Image",
                data: [
                  SvgPicture.asset(AppImages.imageSelect),
                ],
                onTap: () => Navigator.pop(context, OptionsType.image),
              ),
              0.1.ph,
              SelectQuestionWidget(
                text: 'Text+Image',
                data: [
                  const Text(
                    "Aa",
                    style: TextStyle(
                      color: AppColors.c_111111,
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SvgPicture.asset(AppImages.imageSelect),
                ],
                onTap: () => Navigator.pop(context, OptionsType.textImage),
              ),
            ],
          ),
        ),
      );
    },
  );
}
