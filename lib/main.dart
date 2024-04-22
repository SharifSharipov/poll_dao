/*import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Enter your message...',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                saveToken(_controller.text);
              },
              child: Text('Save Token'),
            ),
            ElevatedButton(
              onPressed: () {
                getToken().then((value) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Token'),
                        content: Text(value ?? 'Token not found'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('Close'),
                          ),
                        ],
                      );
                    },
                  );
                });
              },
              child: Text('Get Token'),
            ),
          ],
        ),
      ),
    );
  }

  // Функция для сохранения токена
  void saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
    setState(() {
      _controller.clear();
    });
  }

  // Функция для получения токена
  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }
}*/
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:poll_dao/src/core/extentions/extentions.dart';
import 'package:poll_dao/src/features/profile_page/domain/repositories/repository.dart';
import 'package:poll_dao/src/features/profile_page/domain/service/service.dart';
import 'package:poll_dao/src/features/profile_page/presentation/manager/fetch_profile_data_bloc/fetch_profile_data_bloc.dart';

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
    return BlocProvider(
  create: (context) => FetchProfileDataBloc(profileRepository: ProfileRepository(apiService: Service())),
  child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //home: NewPollPage(),
      initialRoute: RouteNames.splashPage,
      onGenerateRoute: AppRoutes.generateRoute,
    ),
);
  }
}

/*class ImageExternal extends StatefulWidget {
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
}*/
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
