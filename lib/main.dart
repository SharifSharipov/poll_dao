import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:poll_dao/src/core/extentions/extentions.dart';

import 'src/config/routes/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //home: NewPollPage(),
      initialRoute: RouteNames.splashPage,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}

class ImageExternal extends StatefulWidget {
  const ImageExternal({super.key});

  @override
  State<ImageExternal> createState() => _ImageExternalState();
}

class _ImageExternalState extends State<ImageExternal> {
  final pickImage = ImagePicker();
  File? imageFile;
  Future pickImageFromGallery() async {
    final image = await pickImage.pickImage(source: ImageSource.gallery, imageQuality: 80);
    if(image == null) return;
    setState(() {
      imageFile = File(image.path);
        });
  }
  Future pickImageFromCamera() async {
    final image = await pickImage.pickImage(source: ImageSource.camera, imageQuality: 80);
    if(image == null) return;
    setState(() {
      imageFile = File(image.path);
        });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("External image"),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(onPressed: () {
              pickImageFromGallery();
            }, child: const Text("Image from gallery")),
            TextButton(onPressed: () {
              pickImageFromCamera();
            }, child: const Text("Image from Camera")),
            imageFile == null ? const Text("No image selected") : Image.file(imageFile!.absolute,fit: BoxFit.cover,),
            imageFile == null ? const Text("No image selected") : Image.file(imageFile!.absolute,fit: BoxFit.cover,),
            InkWell(
              onTap: () {
                pickImageFromGallery();
              },
              child:Container(
                height: 200,
                width: 400,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 4.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child:  imageFile != null
                    ? Image.file(imageFile!.absolute,fit: BoxFit.cover,)
                    : const Center(child: Icon(Icons.add_photo_alternate_outlined,size: 60,),),
              ),
            ),
            20.ph,
          ],
        ),
      ),
    );
  }
}
/*  Future<void> _pickImage() async {
    XFile? pickedFile = await pickImage;
    setState(() {
      _imageFile = pickedFile;
    });
  }*/

/*  Future<void> _uploadImage() async {
    String? downloadUrl = await uploadImageToFirebase(_imageFile);
    setState(() {
      _imageUrl = downloadUrl;
    });
  }*/
