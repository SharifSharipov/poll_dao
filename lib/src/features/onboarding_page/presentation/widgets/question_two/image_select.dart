import 'package:flutter/material.dart';
import 'package:poll_dao/src/features/onboarding_page/presentation/widgets/question_two/selected_unselected.dart';

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
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Image.asset(
          widget.icon,
          height: height*.15,
          width: width*0.35,
        ),
        Positioned(
          bottom: 5,
          right: 5,
          child: SelectedUnselected(
            isSelected: widget.isSelected,
            onTap: widget.onTap,
          ),
        )
      ],
    );
  }
}
