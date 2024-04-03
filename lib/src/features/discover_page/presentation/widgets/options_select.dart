import 'package:flutter/material.dart';
import 'package:poll_dao/src/core/extentions/extentions.dart';

import '../../../../core/colors/app_colors.dart';
import 'answers.dart';

class OptionsSelect extends StatefulWidget {
  final VoidCallback onTap;
  final String textOne;
  final String textTwo;
  final bool isSelected;

  const OptionsSelect({
    Key? key,
    required this.onTap,
    required this.textOne,
    required this.textTwo,
    this.isSelected = false,
  }) : super(key: key);

  @override
  _OptionsSelectState createState() => _OptionsSelectState();
}

class _OptionsSelectState extends State<OptionsSelect> {
  late bool _isSelected;

  @override
  void initState() {
    _isSelected = widget.isSelected;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _isSelected = !_isSelected;
        });
        widget.onTap();
      },
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: _isSelected ? AppColors.secondary : AppColors.c_5856D6,
        ),
        child: Row(
          children: [
           15.pw,
            Answers(context,widget.textOne),
            15.pw,
            Text(
              widget.textTwo,
              style: TextStyle(color: _isSelected ? AppColors.black : AppColors.white),
            ),
          ],
        ),
      ),
    );
  }
}
