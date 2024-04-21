import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:poll_dao/src/core/colors/app_colors.dart';
import 'package:poll_dao/src/core/icons/app_icons.dart';

class ImageSelect extends StatefulWidget {
  const ImageSelect({super.key});

  @override
  State<ImageSelect> createState() => _ImageSelectState();
}

class _ImageSelectState extends State<ImageSelect> {
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Select'),
        backgroundColor: AppColors.secondary,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: CustomScrollView(
          slivers: <Widget>[
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
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: selectImage,
        backgroundColor: AppColors.black,
        child: const Icon(Icons.add),
      ),
    );
  }
}

/*  Expanded(
                child: GridView.builder(
                  itemCount: imageFiles.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (BuildContext context, int index) {
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
                            icon: SvgPicture.asset(AppImages.cancel,height: 24,width: 24,),
                            onPressed: () {
                              deleteImage(index);
                            },
                            color: Colors.red,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),*/