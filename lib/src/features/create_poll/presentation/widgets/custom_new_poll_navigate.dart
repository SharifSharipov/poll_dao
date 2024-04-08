import 'package:flutter/material.dart';
import 'package:poll_dao/src/features/create_poll/presentation/widgets/text_widget.dart';

import '../../../../core/colors/app_colors.dart';

Widget customNewPollNavigate(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      const Text(
        "dataaaa",
        style: TextStyle(color: Colors.transparent),
      ),
      customTextWidget(text: "New poll", color: AppColors.black),
      TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Done', style: TextStyle(color: AppColors.c_0D72FF, fontSize: 17)))
    ],
  );
}
