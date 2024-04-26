import 'package:image_picker/image_picker.dart';

Future<List<String>?> selectMultipleImages() async {
  final List<XFile> selectedImages = await ImagePicker().pickMultiImage();
  if (selectedImages.isNotEmpty) {
    return selectedImages.map((e) => e.path).toList();
  }
  return null;
}

Future<String?> getImage() async {
  final image = await ImagePicker().pickImage(source: ImageSource.gallery);
  return image?.path;
}
