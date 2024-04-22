import 'package:flutter/material.dart';
import 'package:poll_dao/src/core/colors/app_colors.dart';
import 'package:poll_dao/src/core/extentions/extentions.dart';
import 'package:poll_dao/src/features/create_poll/presentation/widgets/custom_new_poll_navigate.dart';
import 'package:poll_dao/src/features/create_poll/presentation/widgets/new_poll_text_field.dart';

import '../../../create_poll/presentation/widgets/text_widget.dart';

Widget lastedWidget({required BuildContext context, required TextEditingController controllerOne}) {
  return Column(
    children: [
      15.ph,
      customNewPollNavigate(context),
      20.ph,
      Padding(
        padding: const EdgeInsets.only(
          left: 20,
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: customTextWidget(text: "Question", color: AppColors.black),
        ),
      ),
      10.ph,
      BaseNewPollTextField(
        hintText: 'Ask question  ',
        controller: controllerOne,
      ),
      Padding(
        padding: const EdgeInsets.only(
          left: 20,
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: customTextWidget(text: "Options", color: AppColors.black),
        ),
      ),
      10.ph,
    ],
  );
}