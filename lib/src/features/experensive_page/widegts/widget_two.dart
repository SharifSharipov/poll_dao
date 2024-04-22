import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:poll_dao/src/core/colors/app_colors.dart';
import 'package:poll_dao/src/core/icons/app_icons.dart';
import 'package:poll_dao/src/features/create_poll/presentation/widgets/answer_button.dart';

import '../../../core/constants/answer_constants.dart';

class WidgetTwo extends StatefulWidget {
  const WidgetTwo({super.key});

  @override
  State<WidgetTwo> createState() => _WidgetTwoState();
}

class _WidgetTwoState extends State<WidgetTwo> {
  final List<TextEditingController> textControllers = [TextEditingController()];
  final List<File?> imageFiles = [null];
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: textControllers.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
          child: Container(
            width: double.maxFinite,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppColors.white,
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 14),
                        child: AnswerButtonFon(
                          answer: answerList[index], // Assuming answerList is defined elsewhere
                          onTap: () {},
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: TextField(
                          controller: textControllers[index],
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Option text',
                          ),
                          onChanged: (value) {
                            if (index == textControllers.length - 1 && value.isNotEmpty) {
                              setState(() {
                                textControllers.add(TextEditingController());
                                imageFiles.add(null); // Add null for new image file
                              });
                            }
                          },
                        ),
                      ),
                      textControllers[index].text.isNotEmpty
                          ? IconButton(
                        onPressed: () {
                          setState(() {
                            textControllers[index].clear();
                          });
                        },
                        icon: SvgPicture.asset(
                          AppImages.cancel,
                          width: 20,
                        ),
                      )
                          : const SizedBox(),
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          AppImages.graber,
                          width: 30,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    pickImageFromGallery(index);
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height / 4.3,
                    width: MediaQuery.of(context).size.width / 1.25,
                    decoration: BoxDecoration(
                      color: AppColors.secondary,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        imageFiles[index] != null
                            ? Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.file(
                              imageFiles[index]!,
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
                              imageFiles[index] = null;
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
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> pickImageFromGallery(int index) async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    if (pickedFile == null) return;
    setState(() {
      imageFiles[index] = File(pickedFile.path);
    });
  }
}
