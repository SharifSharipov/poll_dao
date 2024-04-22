import 'package:flutter/material.dart';
import 'package:poll_dao/src/core/colors/app_colors.dart';
import 'package:poll_dao/src/core/extentions/extentions.dart';
import 'package:poll_dao/src/features/create_poll/presentation/widgets/new_poll_text_field.dart';

import '../../../create_poll/presentation/widgets/text_widget.dart';

class PollTitleWidget extends StatelessWidget {
  const PollTitleWidget({super.key, this.controllerOne, this.onChanged, this.onDone, this.isValidated = true});
  final TextEditingController? controllerOne;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onDone;
  final bool isValidated;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Align(
            alignment: Alignment.centerLeft,
            child: customTextWidget(text: "Question", color: AppColors.black),
          ),
        ),
        10.ph,
        BaseNewPollTextField(
          isValidated: isValidated,
          onChanged: onChanged,
          hintText: 'Title for poll',
          controller: controllerOne,
        ),
      ],
    );
  }
}
