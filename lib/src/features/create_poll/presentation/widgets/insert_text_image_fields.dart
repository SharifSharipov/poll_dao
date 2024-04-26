import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:poll_dao/src/core/colors/app_colors.dart';
import 'package:poll_dao/src/core/extentions/extentions.dart';
import 'package:poll_dao/src/core/icons/app_icons.dart';
import 'package:poll_dao/src/features/create_poll/presentation/widgets/answer_button.dart';

import '../../../../core/constants/answer_constants.dart';

class InsertTextImageFilds extends StatefulWidget {
  const InsertTextImageFilds(
      {super.key,  required this.onTapOne, required this.controller, required this.count,});
  final int count;
  final TextEditingController controller;
  final VoidCallback onTapOne;

  @override
  State<InsertTextImageFilds> createState() => _InsertTextImageFildsState();
}

class _InsertTextImageFildsState extends State<InsertTextImageFilds> {
  XFile? image;

  @override
  void initState() {
    ///getImage();
    super.initState();
  }

  getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      this.image = image;
    });
  }
  void deleteImage() {
    setState(() {
      image = null;
    });
  }


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(bottom: 20),
      child: Container(
        padding:const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 14),
                  child: AnswerButtonFon(
                    answer: answerList[widget.count],
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
                                      onPressed: widget.onTapOne,
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
            20.ph,
            InkWell(
              onTap: () {
                getImage();
              },
              child: Container(
                height: height / 4.3,
                width: width / 1.25,
                decoration: BoxDecoration(
                  //border: Border.all(color: Colors.grey, width: 4.0),
                  color: AppColors.secondary,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    image!=null
                        ? Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image.file(
                          File(image!.path),
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
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
                            style: TextStyle(
                                color: AppColors.black,
                                fontSize: 32,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          deleteImage();
                        });
                      },
                      icon: SvgPicture.asset(
                        AppImages.cancel,
                        width: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            20.ph,
          ],
        ),
      ),
    );
  }
}