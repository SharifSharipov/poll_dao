import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:poll_dao/src/core/icons/app_icons.dart';
class WidgetThree extends StatefulWidget {
  const WidgetThree({super.key});

  @override
  State<WidgetThree> createState() => _WidgetThreeState();
}

class _WidgetThreeState extends State<WidgetThree> {
  final pickImage = ImagePicker();
  List<XFile?> imageFiles = [];

  void selectImage() async {
    final List<XFile> selectedImages = await pickImage.pickMultiImage();
    if (selectedImages.isNotEmpty) {
      setState(() {
        imageFiles.addAll(selectedImages);
      });
    }
  }

  void deleteImage(int index) {
    setState(() {
      imageFiles.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
   return GridView.count(
     crossAxisCount: 3,
     mainAxisSpacing: 10.0,
     crossAxisSpacing: 10.0,
     childAspectRatio: 1.0,
     children: List.generate(imageFiles.length, (index) {
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
     }),
   );
  }
}
