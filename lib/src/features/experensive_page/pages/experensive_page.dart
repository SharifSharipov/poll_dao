
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:poll_dao/src/core/extentions/extentions.dart';
import 'package:poll_dao/src/features/create_poll/presentation/widgets/add_options.dart';
import 'package:poll_dao/src/features/create_poll/presentation/widgets/advanced_audince_control.dart';
import 'package:poll_dao/src/features/custom_sliver_example/presentation/widgets/last_widget.dart';
import 'package:poll_dao/src/features/custom_sliver_example/presentation/widgets/type_select_options.dart';
import 'package:poll_dao/src/features/experensive_page/widegts/widget_one.dart';

class ExpensivePage extends StatefulWidget {
  const ExpensivePage({super.key});

  @override
  State<ExpensivePage> createState() => _ExpensivePageState();
}

class _ExpensivePageState extends State<ExpensivePage> {
  final List<Widget> widgetList = [];
  TextEditingController controllerOne = TextEditingController();
  TextEditingController controllerTwo = TextEditingController();
  List<TextEditingController> textControllers = [TextEditingController()];
  List<XFile?> imageFiles = [];
  final pickImage = ImagePicker();
  bool showAddOptions = true;
  int selecteddata = 1;

  Future<void> pickImageFromGallery(int index) async {
    final image = await pickImage.pickImage(source: ImageSource.gallery, imageQuality: 80);
    if (image == null) return;
    setState(() {
      imageFiles[index] = XFile(image.path);
    });
  }

  void selectImage() async {
    final List<XFile> selectedImages = await pickImage.pickMultiImage();
    if (selectedImages.isNotEmpty) {
      setState(() => imageFiles.addAll(selectedImages));
    }
  }

  void deleteImage(int index) => setState(() => imageFiles.removeAt(index));

  @override
  void initState() {
    super.initState();
    textControllers = [TextEditingController()];
    imageFiles = [null];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Experensive Page"),
      ),
      body: ListView(
        children: [
          lastedWidget(context: context, controllerOne: controllerOne),
          // if (selecteddata == 1) const WidgetOne(),
          // if (selecteddata == 2) const WidgetTwo(),
          // if (selecteddata == 3)
          //   GridView.count(
          //     crossAxisCount: 3,
          //     mainAxisSpacing: 10.0,
          //     crossAxisSpacing: 10.0,
          //     childAspectRatio: 1.0,
          //     children: List.generate(imageFiles!.length, (index) {
          //       return Stack(
          //         children: [
          //           Container(
          //             margin: const EdgeInsets.all(5),
          //             child: ClipRRect(
          //               borderRadius: BorderRadius.circular(10),
          //               child: Image.file(
          //                 File(imageFiles[index]?.path ?? ""),
          //                 fit: BoxFit.cover,
          //                 width: double.infinity,
          //                 height: double.infinity,
          //               ),
          //             ),
          //           ),
          //           Positioned(
          //             top: 5,
          //             right: 5,
          //             child: IconButton(
          //               icon: SvgPicture.asset(
          //                 AppImages.cancel,
          //                 height: 24,
          //                 width: 24,
          //               ),
          //               onPressed: () {
          //                 deleteImage(index);
          //               },
          //               color: Colors.red,
          //             ),
          //           ),
          //         ],
          //       );
          //     }),
          //   ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) => widgetList[index],
            itemCount: widgetList.length,
          ),
          30.ph,
          AddOptions(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return TypeOptions(
                    onTapOne: () {
                      setState(() {
                        widgetList.add(const WidgetOne());
                        Navigator.pop(context);
                      });
                    },
                    onTapTwo: () {
                      setState(() {
                        selecteddata = 2;
                        Navigator.pop(context);
                      });
                    },
                    onTapThree: () {
                      setState(() {
                        selectImage();
                        selecteddata = 3;
                        Navigator.pop(context);
                      });
                    },
                  );
                },
              );
            },
          ),
          30.ph,
          const AdvancedAudienceControl(),
        ],
      ),
    );
  }
}
