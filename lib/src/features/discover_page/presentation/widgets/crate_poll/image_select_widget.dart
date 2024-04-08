import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:poll_dao/src/core/extentions/extentions.dart';
import 'package:poll_dao/src/core/icons/app_icons.dart';
import 'package:poll_dao/src/features/discover_page/presentation/widgets/crate_poll/image_data_text_field.dart';
class ImageSelectWidget extends StatefulWidget {
  const ImageSelectWidget(
      {super.key,
        required this.textEditingController,
        required this.onTapOne,
        required this.answer,
        required this.onTapTwo, required this.imageSelect});
  final TextEditingController textEditingController;
  final VoidCallback onTapOne;
  final VoidCallback onTapTwo;
  final String answer;
  final String imageSelect;

  @override
  State<ImageSelectWidget> createState() => _ImageSelectWidgetState();
}

class _ImageSelectWidgetState extends State<ImageSelectWidget> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        ImageDataTextField(controller: widget.textEditingController, hintText: 'insert text', answer: widget.answer , onTapOne: () {  }, onTapTwo: () {  },),
        20.ph,
        Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
                width: width / 1.09,
                height: height / 4,
                decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: Image.asset(widget.imageSelect)),
            Positioned(
                top: 5,
                right: 3,
                child: IconButton(
                    onPressed: widget.onTapOne,
                    icon: SvgPicture.asset(AppImages.cancel))),
          ],
        ),
      ],
    );
  }
}