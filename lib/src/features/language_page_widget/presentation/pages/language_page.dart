import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:poll_dao/src/config/routes/routes.dart';
import 'package:poll_dao/src/core/colors/app_colors.dart';
import 'package:poll_dao/src/core/icons/app_icons.dart';
import 'package:poll_dao/src/core/constants/language_list.dart';
import 'package:poll_dao/src/features/language_page_widget/presentation/widgets/language_widget.dart';
class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});
  @override
  State<LanguagePage> createState() => _LanguagePageState();
}
class _LanguagePageState extends State<LanguagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(onPressed: () {
          Navigator.pushNamed(context, RouteNames.discoverPage);
        }, icon:SvgPicture.asset(AppImages.arrowBackIos),),
        title: const Text(
          "Languages",
          style: TextStyle(color: AppColors.black, fontSize: 17, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: ListView.separated(
        itemCount: languages.length,
        separatorBuilder: (context, index) => Divider(
          color: AppColors.black.withOpacity(0.3),
          height: 1,
        ),
        itemBuilder: (context, index) => LanguageWidget(
          text: languages[index],
          onTap: () {},
        ),
      ),
    );
  }
}
