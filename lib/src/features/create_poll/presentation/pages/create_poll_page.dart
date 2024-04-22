import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:poll_dao/src/core/colors/app_colors.dart';
import 'package:poll_dao/src/core/extentions/extentions.dart';
import 'package:poll_dao/src/core/icons/app_icons.dart';
import 'package:poll_dao/src/features/create_poll/presentation/widgets/add_options.dart';
import 'package:poll_dao/src/features/create_poll/presentation/widgets/advanced_audince_control.dart';
import 'package:poll_dao/src/features/create_poll/presentation/widgets/answer_button.dart';
import 'package:poll_dao/src/features/create_poll/presentation/widgets/select_question_type.dart';
import 'package:poll_dao/src/features/widgets/base_bottom_sheet.dart';

import '../../../../core/constants/answer_constants.dart';

class CreatePollPage extends StatefulWidget {
  const CreatePollPage({super.key});

  @override
  State<CreatePollPage> createState() => _CreatePollPageState();
}

class _CreatePollPageState extends State<CreatePollPage> {
  TextEditingController controllerOne = TextEditingController();
  TextEditingController controllerTwo = TextEditingController();
  List<TextEditingController> textControllers = [TextEditingController()];
  List<File?> imageFiles = [null];
  final pickImage = ImagePicker();
  bool showAddOptions = true;
  int selecteddata = 0;

  Future<void> pickImageFromGallery(int index) async {
    final image = await pickImage.pickImage(source: ImageSource.gallery, imageQuality: 80);
    if (image == null) return;
    setState(() {
      imageFiles[index] = File(image.path);
    });
  }

  void selectImage() async {
    final List<XFile> imageFiles = await pickImage.pickMultiImage();
    if (imageFiles.isNotEmpty) {
      setState(() {
        imageFiles.addAll(imageFiles);
      });
    }
  }

  void deleteImage(int index) {
    setState(() {
      imageFiles.removeAt(index);
    });
  }

  @override
  void initState() {
    super.initState();
    textControllers = [TextEditingController()];
    imageFiles = [null];
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return BaseBottomSheet(
      height: height * 0.99,
      backgroundColor: AppColors.secondary,
      child: CustomScrollView(
        slivers: [
          // SliverToBoxAdapter(
          //   child:lastedWidget(context: context, controllerOne:controllerOne),
          // ),
          if (selecteddata == 1)
            SliverVisibility(
              visible: true,
              sliver: SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColors.white,
                    ),
                    child: Column(
                      children: [
                        20.ph,
                        ListView.separated(
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 15, right: 10),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 14),
                                    child: AnswerButtonFon(
                                      answer: answerList[index],
                                      onTap: () {},
                                    ),
                                  ),
                                  20.pw,
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
                                      )),
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: EdgeInsets.only(left: width / 7),
                              child: const Divider(
                                color: AppColors.c_A0A4A7,
                                height: 1,
                                thickness: 1,
                              ),
                            );
                          },
                          itemCount: textControllers.length,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          if (selecteddata == 2)
            SliverVisibility(
              visible: true,
              sliver: SliverToBoxAdapter(
                child: ListView.builder(
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
                                      answer: answerList[index],
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
                            20.ph,
                            InkWell(
                              onTap: () {
                                pickImageFromGallery(index);
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
                                    imageFiles[index] != null
                                        ? Center(
                                            child: Image.file(
                                              imageFiles[index]!,
                                              fit: BoxFit.cover,
                                              width: double.infinity,
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
                            20.ph,
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: textControllers.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                ),
              ),
            ),
          if (selecteddata == 3)
            SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(5),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.file(
                            File(imageFiles[index]!.path),
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 5,
                        right: 5,
                        child: IconButton(
                          icon: SvgPicture.asset(
                            AppImages.cancel,
                            height: 24,
                            width: 24,
                          ),
                          onPressed: () {
                            deleteImage(index);
                          },
                          color: Colors.red,
                        ),
                      ),
                    ],
                  );
                },
                childCount: imageFiles.length,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 1.0,
              ),
            ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                showAddOptions ? 30.ph : 0.ph,
                AddOptions(
                  onTap: () {
                    showCupertinoDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Center(
                          child: Padding(
                            padding: EdgeInsets.only(right: width / 3),
                            child: CupertinoActionSheet(
                              actions: <Widget>[
                                0.1.ph,
                                SelectQuestionWidget(
                                  text: "Text",
                                  data: const [
                                    Text(
                                      "Aa",
                                      style: TextStyle(
                                        color: AppColors.c_111111,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                  onTap: () {
                                    setState(() {
                                      selecteddata = 1;
                                      Navigator.pop(context);
                                    });
                                  },
                                ),
                                0.1.ph,
                                SelectQuestionWidget(
                                  text: "Image",
                                  data: [SvgPicture.asset(AppImages.imageSelect)],
                                  onTap: () {
                                    setState(() {
                                      selectImage();
                                      selecteddata = 3;
                                      Navigator.pop(context);
                                    });
                                  },
                                ),
                                0.1.ph,
                                SelectQuestionWidget(
                                  text: 'Text+Image',
                                  data: [
                                    const Text(
                                      "Aa",
                                      style: TextStyle(
                                        color: AppColors.c_111111,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SvgPicture.asset(AppImages.imageSelect),
                                  ],
                                  onTap: () {
                                    setState(() {
                                      selecteddata = 2;
                                      Navigator.pop(context);
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
                30.ph,
                const AdvancedAudienceControl(),
              ],
            ),
          )
        ],
      ),
    );
  }
}



/* showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: AppColors.white,
                                      elevation: 0,
                                      context: context,
                                      builder: (context) =>const GeneRationTextField());*/
