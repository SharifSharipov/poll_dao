import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:poll_dao/src/core/colors/app_colors.dart';
import 'package:poll_dao/src/core/extentions/extentions.dart';
import 'package:poll_dao/src/core/icons/app_icons.dart';
import 'package:poll_dao/src/features/create_poll/presentation/widgets/answer_button.dart';

import '../../../create_poll/presentation/pages/experense.dart';
class InsertTextTwoWariants extends StatefulWidget {
  const InsertTextTwoWariants({super.key, required this.index, required this.onTap, required this.controller});
  final int index;
  final VoidCallback onTap;
  final TextEditingController controller;

  @override
  State<InsertTextTwoWariants> createState() => _InsertTextTwoWariantsState();
}

class _InsertTextTwoWariantsState extends State<InsertTextTwoWariants> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child:Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 14),
            child: AnswerButtonFon(
              answer: answerList[widget.index],
              onTap: () {},
            ),
          ),
          10.pw,
          Expanded(
            child: Theme(
              data: ThemeData(primaryColor: AppColors.c_111111),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: widget.controller,
                      decoration: InputDecoration(
                          suffixIcon: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              widget.controller.text.isNotEmpty
                                  ? IconButton(
                                onPressed: () {
                                  setState(() {
                                    widget.controller.clear();
                                  });
                                },
                                icon: SvgPicture.asset(
                                  AppImages.cancel,
                                  width: 20,
                                ),
                              )
                                  : const SizedBox(),
                              IconButton(
                                onPressed:widget.onTap,
                                icon: SvgPicture.asset(AppImages.graber, width: 30),
                              ),
                            ],
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
