import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:poll_dao/src/core/extentions/extentions.dart';
import 'package:poll_dao/src/features/create_poll/presentation/widgets/advanced_audince_control.dart';

class ExpensivePage extends StatefulWidget {
  const ExpensivePage({Key? key}) : super(key: key);

  @override
  State<ExpensivePage> createState() => _ExpensivePageState();
}

class _ExpensivePageState extends State<ExpensivePage> {
  final List<Widget> widgetList = [];
  final TextEditingController controllerOne = TextEditingController();
  final TextEditingController controllerTwo = TextEditingController();
  final List<TextEditingController> textControllers = [TextEditingController()];
  final List<XFile?> imageFiles = [null];
  final picker = ImagePicker();
  bool showAddOptions = true;
  int selectedData = 1; // 1 for text, 2 for image, 3 for image + text

  void selectImageFromGallery() async {
    final pickedImages = await picker.pickMultiImage();
    if (pickedImages.isNotEmpty) {
      setState(() {
        imageFiles.addAll(pickedImages);
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
        title: const Text("Expensive Page"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          if (selectedData == 1)
            TextField(
              controller: controllerOne,
              decoration: const InputDecoration(labelText: 'Text Field'),
            ),
          if (selectedData == 2)
            Column(
              children: [
                ElevatedButton(
                  onPressed: selectImageFromGallery,
                  child: const Text('Select Image'),
                ),
                GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: imageFiles.length,
                  itemBuilder: (context, index) {
                    if (imageFiles[index] != null) {
                      return Stack(
                        children: [
                          Image.file(
                            File(imageFiles[index]!.path),
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: () {
                                deleteImage(index);
                              },
                            ),
                          ),
                        ],
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
              ],
            ),
          if (selectedData == 3)
            Column(
              children: [
                TextField(
                  controller: controllerTwo,
                  decoration: const InputDecoration(labelText: 'Text Field'),
                ),
                ElevatedButton(
                  onPressed: selectImageFromGallery,
                  child: const Text('Select Image'),
                ),
                GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: imageFiles.length,
                  itemBuilder: (context, index) {
                    if (imageFiles[index] != null) {
                      return Stack(
                        children: [
                          Image.file(
                            File(imageFiles[index]!.path),
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: () {
                                deleteImage(index);
                              },
                            ),
                          ),
                        ],
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
              ],
            ),
          MaterialButton(onPressed: (){
            showCupertinoModalPopup(
              context: context,
              builder: (BuildContext context) => CupertinoActionSheet(
                actions: [
                  CupertinoActionSheetAction(
                    onPressed: () {
                      setState(() {
                        selectedData = 1;
                      });
                      Navigator.pop(context); // Close the action sheet after selection
                    },
                    child: Text('Text'),
                  ),
                  CupertinoActionSheetAction(
                    onPressed: () {
                      setState(() {
                        selectedData = 2;
                      });
                      Navigator.pop(context); // Close the action sheet after selection
                    },
                    child: Text('Image'),
                  ),
                  CupertinoActionSheetAction(
                    onPressed: () {
                      setState(() {
                        selectedData = 3;
                      });
                      Navigator.pop(context); // Close the action sheet after selection
                    },
                    child: Text('Image + Text'),
                  ),
                ],
                cancelButton: CupertinoActionSheetAction(
                  onPressed: () {
                    Navigator.pop(context); // Close the action sheet without selection
                  },
                  child: Text('Cancel'),
                ),
              ),
            );

          }, child: const Text('Create Poll'),),
          30.ph,
          const AdvancedAudienceControl(),
        ],
      ),
    );
  }
}
