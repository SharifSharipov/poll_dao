import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:poll_dao/src/core/colors/app_colors.dart';
import 'package:poll_dao/src/core/extentions/extentions.dart';
import 'package:poll_dao/src/core/icons/app_icons.dart';
import 'package:poll_dao/src/features/create_poll/presentation/widgets/select_question_type.dart';

class TypeOptions extends StatefulWidget {
  const TypeOptions({
    super.key,
    required this.onTapOne,
    required this.onTapTwo,
    required this.onTapThree,
  });

  final VoidCallback onTapOne;
  final VoidCallback onTapTwo;
  final VoidCallback onTapThree;

  @override
  State<TypeOptions> createState() => _TypeOptionsState();
}

class _TypeOptionsState extends State<TypeOptions> {
  @override
  Widget build(BuildContext context) {
    final pickImage = ImagePicker();
    void selectImage() async {
      final List<XFile> imageFiles = await pickImage.pickMultiImage();
      if (imageFiles.isNotEmpty) {
        setState(() {
          imageFiles.addAll(imageFiles);
        });
      }
    }

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Center(
      child: Padding(
        padding: EdgeInsets.only(right: width / 3),
        child: CupertinoActionSheet(
          actions: <Widget>[
            0.1.ph,
            SelectQuestionWidget(
                text: "Text",
                data: const [
                  Text(
                    "Aa",
                    style: TextStyle(
                      color: AppColors.c_111111,
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
                onTap: widget.onTapOne),
            0.1.ph,
            SelectQuestionWidget(
              text: "Image",
              data: [SvgPicture.asset(AppImages.imageSelect)],
              onTap: widget.onTapTwo,
            ),
            0.1.ph,
            SelectQuestionWidget(
              text: 'Text+Image',
              data: [
                const Text(
                  "Aa",
                  style: TextStyle(
                    color: AppColors.c_111111,
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SvgPicture.asset(AppImages.imageSelect),
              ],
              onTap: widget.onTapThree,
            ),
          ],
        ),
      ),
    );
  }
}
