import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:poll_dao/src/core/colors/app_colors.dart';
import 'package:poll_dao/src/features/create_poll/presentation/widgets/add_options.dart';
import 'package:poll_dao/src/features/create_poll/presentation/widgets/advanced_audince_control.dart';

enum AnswerType { text, image, image_text }

class PokayFuData extends StatefulWidget {
  const PokayFuData({super.key});

  @override
  State<PokayFuData> createState() => _PokayFuDataState();
}

class _PokayFuDataState extends State<PokayFuData> {
  List<Widget> widgetList = <Widget>[];
  AnswerType? answerType;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.secondary,
        title: const Text('PokayFu Data'),
      ),
      backgroundColor: AppColors.secondary,
      body: SingleChildScrollView(
          child: Column(
        children: [
          ...widgetList,
          AddOptions(
            onTap: () async {
              if (widgetList.isNotEmpty) {
                switch (answerType!) {
                  case AnswerType.text:
                    widgetList.add(const TextPollWidget());
                    break;
                  case AnswerType.image:
                    widgetList.add(const ImagePollWidget());
                    break;
                  case AnswerType.image_text:
                    widgetList.add(const TextImagePollWidget());
                }
                setState(() {});
                return;
              }
              showDialog(
                  context: context,
                  builder: (context) {
                    return Center(
                      child: Container(
                        color: AppColors.white,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextButton(
                                onPressed: () {
                                  index++;
                                  answerType = AnswerType.text;
                                  widgetList.add(const TextPollWidget());
                                  setState(() {
                                    Navigator.pop(context);
                                  });
                                },
                                child: const Text("Text")),
                            TextButton(
                                onPressed: () async {
                                  answerType = AnswerType.image;

                                  widgetList.add(const ImagePollWidget());
                                  setState(() {
                                    Navigator.pop(context);
                                  });
                                },
                                child: const Text("Image")),
                            TextButton(
                                onPressed: () async {
                                  answerType = AnswerType.image_text;

                                  widgetList.add(const TextImagePollWidget());

                                  setState(() {
                                    Navigator.pop(context);
                                  });
                                },
                                child: const Text("Text + Image")),
                          ],
                        ),
                      ),
                    );
                  });
            },
          ),
          const AdvancedAudienceControl(),
        ],
      )),
    );
  }
}

class TextPollWidget extends StatelessWidget {
  const TextPollWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField();
  }
}

class ImagePollWidget extends StatefulWidget {
  const ImagePollWidget({super.key});

  @override
  _ImagePollWidgetState createState() => _ImagePollWidgetState();
}

class _ImagePollWidgetState extends State<ImagePollWidget> {
  List<File> imageFiles = [];
  final ImagePicker _picker = ImagePicker();

  Future<void> selectImage() async {
    List<XFile>? imageFilesFromGallery = await _picker.pickMultiImage();
    if (imageFilesFromGallery.isNotEmpty) {
      setState(() {
        imageFiles.addAll(imageFilesFromGallery.map((e) => File(e.path)));
      });
    }
  }

  void deleteImage(int index) {
    setState(() {
      if (index >= 0 && index < imageFiles.length) {
        imageFiles.removeAt(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemCount: imageFiles.length,
      itemBuilder: (BuildContext context, int index) {
        return Stack(
          children: [
            Container(
              margin: const EdgeInsets.all(5),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.file(
                  imageFiles[index],
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
                  'assets/icons/cancel.svg', // Change this to your cancel icon path
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
    );
  }
}

class TextImagePollWidget extends StatefulWidget {
  const TextImagePollWidget({super.key});

  @override
  State<TextImagePollWidget> createState() => _TextImagePollWidgetState();
}

class _TextImagePollWidgetState extends State<TextImagePollWidget> {
  XFile? image;

  @override
  void initState() {
    getImage();
    super.initState();
  }

  getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      this.image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(),
        image == null ? const SizedBox() : Image.file(File(image!.path)),
      ],
    );
  }
}
