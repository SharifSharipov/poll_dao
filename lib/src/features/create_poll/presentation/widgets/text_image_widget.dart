import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:poll_dao/src/core/colors/app_colors.dart';
import 'package:poll_dao/src/core/constants/answer_constants.dart';
import 'package:poll_dao/src/core/extentions/extentions.dart';
import 'package:poll_dao/src/core/icons/app_icons.dart';
import 'package:poll_dao/src/features/create_poll/presentation/widgets/answer_button.dart';
import 'package:poll_dao/src/features/create_poll/utils/utils.dart';

class TextImageWidget extends StatefulWidget {
  const TextImageWidget({
    super.key,
    required this.onTextChanged,
    required this.onImageChanged,
    this.image,
    required this.text,
    required this.isValid,
  });
  final ValueChanged<String> onTextChanged;
  final ValueChanged<String?> onImageChanged;
  final String? image;
  final String text;
  final bool isValid;

  @override
  State<TextImageWidget> createState() => _TextImageWidgetState();
}

class _TextImageWidgetState extends State<TextImageWidget> {
  final controller = TextEditingController();
  final focusNode = FocusNode();
  String? image;

  @override
  void initState() {
    image = widget.image;
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  void deleteImage() {
    image = null;
    widget.onImageChanged('');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(15),
          border: widget.isValid ? null : Border.all(color: Colors.red)),
      child: Column(
        children: [
          Row(
            children: [
              AnswerButtonFon(
                answer: answerList[0],
                onTap: () {},
              ),
              10.pw,
              Expanded(
                child: TextField(
                  focusNode: focusNode,
                  onChanged: widget.onTextChanged,
                  controller: controller,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Insert text',
                      hintStyle: widget.isValid ? null : const TextStyle(color: Colors.red),
                      suffixIcon: controller.text.isNotEmpty
                          ? IconButton(
                              onPressed: () {
                                setState(() {
                                  controller.clear();
                                  widget.onTextChanged('');
                                });
                              },
                              icon: SvgPicture.asset(
                                AppImages.cancel,
                                width: 20,
                              ),
                            )
                          : const SizedBox()),
                ),
              ),
              SizedBox(width: 40, child: SvgPicture.asset(AppImages.graber, width: 24)),
            ],
          ),
          20.ph,
          InkWell(
            onTap: () => getImage().then((value) {
              if (value != null) {
                setState(() {
                  image = value;
                  widget.onImageChanged(value);
                });
              }
            }),
            child: Container(
              height: height / 4.3,
              width: width / 1.25,
              decoration: BoxDecoration(
                //border: Border.all(color: Colors.grey, width: 4.0),
                color: AppColors.secondary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  image != null
                      ? Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.file(File(image!), fit: BoxFit.cover, width: double.infinity),
                          ),
                        )
                      : Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                AppImages.addIcon,
                                height: 40,
                                width: 40,
                              ),
                              const Text(
                                "Add a photo",
                                style: TextStyle(color: AppColors.black, fontSize: 32, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                  IconButton(
                    onPressed: () => deleteImage(),
                    icon: SvgPicture.asset(AppImages.cancel, width: 20),
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
