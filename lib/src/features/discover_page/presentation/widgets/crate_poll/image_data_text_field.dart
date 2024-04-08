import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:poll_dao/src/core/colors/app_colors.dart';
import 'package:poll_dao/src/core/icons/app_icons.dart';
import 'package:poll_dao/src/features/discover_page/presentation/widgets/crate_poll/answer_button.dart';

class ImageDataTextField extends StatefulWidget {
  const ImageDataTextField(
      {Key? key,
        required this.controller,
        required this.hintText,
        required this.answer,
        required this.onTapOne,
        required this.onTapTwo,
        this.onTapThree,})
      : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final String answer;
  final VoidCallback onTapOne;
  final VoidCallback onTapTwo;
  final VoidCallback? onTapThree;
  @override
  State<ImageDataTextField> createState() => _ImageDataTextFieldState();
}

class _ImageDataTextFieldState extends State<ImageDataTextField> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 14),
                child: AnswerButtonFon(
                  answer: widget.answer,
                  onTap: widget.onTapOne,
                ),
              ),
              const SizedBox(width: 10,),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: TextField(
                    controller: TextEditingController(),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: widget.hintText,
                      hintStyle: const TextStyle(
                        color: AppColors.c_A0A4A7,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 14),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: widget.onTapThree,
                        icon: SvgPicture.asset(
                          AppImages.cancel,
                          width: 20,
                        )),
                    IconButton(
                        onPressed: widget.onTapTwo,
                        icon: SvgPicture.asset(
                          AppImages.graber,
                          width: 30,
                        )),
                  ],
                ),
              )
            ],
          ),

        ],
      ),
    );
  }
}