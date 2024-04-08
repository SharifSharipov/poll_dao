import 'package:flutter/material.dart';
import 'package:poll_dao/src/core/colors/app_colors.dart';
import 'package:poll_dao/src/features/discover_page/presentation/widgets/crate_poll/image_data_text_field.dart'; // flutter_svg import qilindi

class InsertAnswer extends StatefulWidget {
  const InsertAnswer(
      {Key? key,
      required this.count,
      required this.hintText,
      required this.onTapOne,
      required this.onTapTwo,
      this.onTapThree,
      required this.controller})
      : super(key: key);
  final int count;
  final String hintText;
  final VoidCallback onTapOne;
  final VoidCallback onTapTwo;
  final VoidCallback? onTapThree;
  final TextEditingController controller;

  @override
  State<InsertAnswer> createState() => _InsertAnswerState();
}

class _InsertAnswerState extends State<InsertAnswer> {
  /* List<TextEditingController> controllers = [];
  @override
  void initState() {
    super.initState();
    for (int i = 0; i < widget.count; i++) {
      controllers.add(TextEditingController());
    }
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }
*/
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
          // padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: AppColors.white,
          ),
          child: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return ImageDataTextField(
                controller: widget.controller,
                hintText: widget.hintText,
                answer: answerList[index],
                onTapOne: widget.onTapOne,
                onTapTwo: widget.onTapTwo,
                onTapThree: widget.onTapThree,
              );
            },
            itemCount: widget.count,
            shrinkWrap: true,
            separatorBuilder: (BuildContext context, int index) {
              if (index != widget.count - 1) {
                return Padding(
                  padding: EdgeInsets.only(left: width / 8, right: width / 42.6),
                  child:const Divider(height: 1, color: AppColors.c_A0A4A7),
                );
              } else {
                return Container();
              }
            },

          )),
    );
  }
}

List<String> answerList = [
  "A",
  "B",
  "C",
  "D",
  "E",
  "F",
  "G",
  "H",
  "I",
  "J",
  "K",
  "L",
  "M",
  "N",
  "O",
  "P",
  "Q",
  "R",
  "S",
  "T",
  "U",
  "V",
  "W",
  "X",
  "Y",
  "Z"
];
