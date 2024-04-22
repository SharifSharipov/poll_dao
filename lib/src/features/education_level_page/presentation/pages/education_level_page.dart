import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:poll_dao/src/config/routes/routes.dart';
import 'package:poll_dao/src/core/colors/app_colors.dart';
import 'package:poll_dao/src/core/icons/app_icons.dart';
import 'package:poll_dao/src/core/constants/coursy_of_study_list.dart';
import 'package:poll_dao/src/features/education_level_page/presentation/widgets/education_level_widget.dart';
class EducationLevelPage extends StatelessWidget {
  const EducationLevelPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, RouteNames.discoverPage);
          },
          icon: SvgPicture.asset(AppImages.arrowBackIos),
        ),
        title: const Text(
          "Education Level",
          style: TextStyle(color: AppColors.black, fontSize: 17, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: ListView.separated(
        itemCount: educationCourses.length,
        separatorBuilder: (context, index) => Divider(
          color: AppColors.black.withOpacity(0.3),
          height: 1,
        ),
        itemBuilder: (context, index) => EducationLevelWidget(
          text: educationCourses[index],
          onTap: () {},
        ),
      ),
    );
  }
}
