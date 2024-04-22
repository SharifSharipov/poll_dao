import 'package:flutter/material.dart';
import 'package:poll_dao/src/features/create_poll/presentation/widgets/text_widget.dart';

import '../../../../core/colors/app_colors.dart';

class CustomNewPollNavigate extends StatelessWidget {
  const CustomNewPollNavigate({super.key, this.onDone, this.onCancel, this.isLoading = false});
  final VoidCallback? onDone;
  final VoidCallback? onCancel;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: onCancel,
          child: const Text('Cancel', style: TextStyle(color: AppColors.c_0D72FF, fontSize: 17)),
        ),
        customTextWidget(text: "New poll", color: AppColors.black),
        TextButton(
          onPressed: onDone,
          child: isLoading
              ? const CircularProgressIndicator.adaptive()
              : const Text('Done', style: TextStyle(color: AppColors.c_0D72FF, fontSize: 17)),
        )
      ],
    );
  }
}
