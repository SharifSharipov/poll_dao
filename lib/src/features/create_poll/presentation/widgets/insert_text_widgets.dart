import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:poll_dao/src/core/colors/app_colors.dart';
import 'package:poll_dao/src/core/extentions/extentions.dart';
import 'package:poll_dao/src/core/icons/app_icons.dart';
import 'package:poll_dao/src/features/create_poll/presentation/widgets/answer_button.dart';
import 'insert_ansver_button.dart';

class InsertTextFields extends StatefulWidget {
  const InsertTextFields({super.key, required this.controllerList, required this.index, required this.onTapTwo});
  final List<TextEditingController> controllerList;
  final int index;
  final VoidCallback onTapTwo;
  @override
  State<InsertTextFields> createState() => _InsertTextFieldsState();
}

class _InsertTextFieldsState extends State<InsertTextFields> {

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: widget.controllerList.length,
          itemBuilder: (context, index) {
            return Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 14),
                  child: AnswerButtonFon(
                    answer: answerList[index],
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
                            controller: widget.controllerList[index],
                            decoration: InputDecoration(
                                suffixIcon: Row(
                                 mainAxisAlignment: MainAxisAlignment.end,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                widget.controllerList[index].text.isNotEmpty
                                    ? IconButton(
                                  onPressed: () {
                                    setState(() {
                                      widget.controllerList[index].clear();
                                    });
                                  },
                                  icon: SvgPicture.asset(
                                    AppImages.cancel,
                                    width: 20,
                                  ),
                                )
                                    : const SizedBox(),
                                IconButton(
                                  onPressed:widget.onTapTwo,
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
            );
          },
        ),
      ),
    );
  }
}
