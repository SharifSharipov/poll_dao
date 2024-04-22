import 'package:flutter/cupertino.dart';
import 'package:poll_dao/src/core/colors/app_colors.dart';
class CupertinoActionSheetActionWidget extends StatelessWidget {
  const CupertinoActionSheetActionWidget({super.key, required this.onPressed, required this.text});
  final VoidCallback onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheetAction(
      onPressed: onPressed,
      isDefaultAction: true,
      child: Text(
        text,
        style:const TextStyle(
          color:AppColors.c_5856D6,
          fontSize: 17
        ),
      ),
    );
  }
}
