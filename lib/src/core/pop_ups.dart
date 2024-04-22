import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:poll_dao/src/core/colors/app_colors.dart';

Future<T?> showAppActionSheet<T>({required BuildContext context, required Widget child}) {
  return showCupertinoModalPopup<T>(
    context: context,
    builder: (context) => child,
  ).then((value) {
    log('value: $value');
    return value;
  });
}

class DiscardActionSheet extends StatelessWidget {
  const DiscardActionSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      title: const Text('Are you sure you want to discard your poll?', style: TextStyle(color: AppColors.c_5B6D83)),
      actions: [
        CupertinoActionSheetAction(
          child: const Text('Discard poll', style: TextStyle(color: CupertinoColors.destructiveRed)),
          onPressed: () => Navigator.pop(context, true),
        ),
        CupertinoActionSheetAction(
          child: const Text('Cancel', style: TextStyle(color: AppColors.black)),
          onPressed: () => Navigator.pop(context, false),
        )
      ],
    );
  }
}
