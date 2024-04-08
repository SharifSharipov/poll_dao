import 'package:flutter/material.dart';
import 'package:poll_dao/src/features/discover_page/presentation/widgets/selected_unselected.dart';
class ImageSelect extends StatefulWidget {
  final bool isSelected;
  final VoidCallback onTap;
  final String icon;

  const ImageSelect({super.key, required this.isSelected, required this.onTap, required this.icon});

  @override
  State<ImageSelect> createState() => _ImageSelectState();
}

class _ImageSelectState extends State<ImageSelect> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Image.asset(
          widget.icon,
          height: height>1194? height * 0.4:height * 0.18,
          width:width>834?width * 0.25 :width * 0.38   ,
        ),
        Positioned(
          bottom: 10,
          left: 8,
          child: SelectedUnselected(
            isSelected: widget.isSelected,
            onTap: widget.onTap,
          ),
        )
      ],
    );
  }
}
