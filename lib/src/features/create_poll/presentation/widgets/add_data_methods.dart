import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:poll_dao/src/core/colors/app_colors.dart';

import 'image_data_text_field.dart';
class AddDataMethods extends StatefulWidget {
  const AddDataMethods({super.key, required this.controllers, required this.hintText});
  final List<TextEditingController> controllers;
  final String hintText;

  @override
  State<AddDataMethods> createState() => _AddDataMethodsState();
}

class _AddDataMethodsState extends State<AddDataMethods> {
  late List<File?> imageFiles;
  final pickImage = ImagePicker();
  @override
  void initState() {
    super.initState();
    imageFiles = [null];
  }
  Future pickImageFromGallery(int index) async {
    final image = await pickImage.pickImage(source: ImageSource.gallery, imageQuality: 80);
    if (image == null) return;
    setState(() {
      imageFiles[index] = File(image.path);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.white,
        ),
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                ImageDataTextField(
                  controller: widget.controllers[index],
                  onChanged: (value) {},
                  hintText: widget.hintText,
                  answer: answerListImage[index],
                  onTapOne: () {},
                  onTapTwo: () {},
                  onTapThree: () {},
                ),
                InkWell(
                  onTap: () {
                    pickImageFromGallery(index); // Pass the index to identify the corresponding text field
                  },
                  child: Container(
                    height: 200,
                    width: 350,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 4.0),
                      borderRadius: BorderRadius.circular(15.0), // Adjusted border radius to match the container
                    ),
                    child: imageFiles[index] != null
                        ? Image.file(
                      imageFiles[index]!.absolute,
                      fit: BoxFit.cover,
                    )
                        : const Center(
                      child: Icon(Icons.add_photo_alternate_outlined, size: 60),
                    ),
                  ),
                ),
              ],
            );
          },
          itemCount: widget.controllers.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
        ),
      ),
    );
  }
}
List<String> answerListImage = [
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