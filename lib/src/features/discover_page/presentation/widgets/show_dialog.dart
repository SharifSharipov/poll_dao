import 'package:flutter/cupertino.dart';
import 'package:poll_dao/src/core/colors/app_colors.dart';
import 'package:poll_dao/src/features/widgets/cupertino_action_sheet_action_widget.dart';

void pollshowDialog(
    {required BuildContext context,
    required VoidCallback onTapOne,
    required VoidCallback onTapTwo,
    required VoidCallback onTapThree}) {
  double width = MediaQuery.of(context).size.width;
  showCupertinoDialog(
    context: context,
    builder: (BuildContext context) {
      return Padding(
        padding: EdgeInsets.only(left: width / 8, right: width / 8),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoActionSheet(
                title: const Text(
                  "Create Account",
                  style: TextStyle(color: AppColors.c_5856D6, fontSize: 17),
                ),
                message: const Text(
                  'Log in your account or create a new one to participate in voting and see poll results',
                  style: TextStyle(
                      color: AppColors.c_111111, fontSize: 13, fontWeight: FontWeight.w400),
                ),
                actions: <Widget>[
                  CupertinoActionSheetActionWidget(
                    onPressed: onTapOne,
                    text: 'Sign up',
                  ),
                  CupertinoActionSheetActionWidget(
                    onPressed: onTapTwo,
                    text: 'Sign in',
                  ),
                  CupertinoActionSheetActionWidget(
                    onPressed: onTapThree,
                    text: 'Cancel',
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}

void pollShowDialog2({
  required context,
  required VoidCallback onTapOne,
  required VoidCallback onTapTwo,
  required VoidCallback onTapThree}) {
    double width = MediaQuery.of(context).size.width;

    showCupertinoDialog(
    context: context,
    builder: (BuildContext context) {
      return Padding(
        padding: EdgeInsets.only(left: width / 8, right: width / 8),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoActionSheet(
                actions: <Widget>[
                  CupertinoActionSheetActionWidget(
                    onPressed: onTapOne,
                    text: 'Change choice',
                  ),
                  CupertinoActionSheetActionWidget(
                    onPressed: onTapTwo,
                    text: 'Delete',
                  ),
                  CupertinoActionSheetActionWidget(
                    onPressed: onTapThree,
                    text: 'Cancel',
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
  }