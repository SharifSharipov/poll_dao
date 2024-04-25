import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class WidgetTwo extends StatefulWidget {
  const WidgetTwo({Key? key}) : super(key: key);

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
      shrinkWrap: true,
      itemCount: textControllers.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 14),
                        child: Icon(Icons.check),
                      ),
                      const SizedBox(width: 20),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: textControllers[index],
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Option text',
                              ),
                            ),
                          ),
                        ],
                      ),
                      if (textControllers[index].text.isNotEmpty)
                        IconButton(
                          onPressed: () {
                            setState(() {
                              textControllers[index].clear();
                            });
                          },
                          icon: const Icon(Icons.cancel),
                        ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.grain),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () async {
                    final pickedFile = await picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
                    if (pickedFile != null) {
                      setState(() {
                        imageFiles[index] = File(pickedFile.path) as File?;
                      });
                    }
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height / 4.3,
                    width: MediaQuery.of(context).size.width / 1.25,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: imageFiles[index] != null
                        ? Image.file(
                      File(imageFiles[index]!.path),
                      fit: BoxFit.cover,
                    )
                        : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.add_photo_alternate),
                        SizedBox(height: 5),
                        Text(
                          'Add a photo',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
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
}
