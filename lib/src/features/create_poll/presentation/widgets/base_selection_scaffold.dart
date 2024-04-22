import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:poll_dao/src/core/colors/app_colors.dart';
import 'package:poll_dao/src/core/icons/app_icons.dart';

class BaseSelectionScaffold extends StatelessWidget {
  const BaseSelectionScaffold({super.key, required this.title, required this.body, required this.result});
  final String title;
  final Widget body;
  final List<String> result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: SvgPicture.asset(AppImages.arrowBackIos),
        ),
        title: Text(
          title,
          style: const TextStyle(color: AppColors.black, fontSize: 17, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, result),
            child: const Text('Сохранить'),
          ),
        ],
      ),
      body: body,
    );
  }
}
