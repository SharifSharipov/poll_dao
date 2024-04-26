import 'package:flutter/material.dart';
import 'package:poll_dao/src/core/colors/app_colors.dart';
import 'package:poll_dao/src/core/constants/education_level.dart';
import 'package:poll_dao/src/features/create_poll/presentation/widgets/selects_item_widget.dart';

import '../../../create_poll/presentation/widgets/single_sellection_widget.dart';

class EducationLevelPage extends StatefulWidget {
  const EducationLevelPage({super.key, this.educationLevels = ''});
  final String educationLevels;

  @override
  State<EducationLevelPage> createState() => _EducationLevelPageState();
}

class _EducationLevelPageState extends State<EducationLevelPage> {
  String _educationLevel = '';

  @override
  void initState() {
    _educationLevel = widget.educationLevels;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleSelectionScaffold(
      title: 'Education Level',
      result: _educationLevel,
      body: ListView.separated(
        itemCount: educationLevel.length,
        separatorBuilder: (context, index) =>
            const Divider(color: AppColors.secondary, height: 1, indent: 20, endIndent: 20),
        itemBuilder: (context, index) => SelectsItemWidget(
          isChosen: _educationLevel.contains(educationLevel[index]),
          text: educationLevel[index],
          onTap: () {
            if (_educationLevel == educationLevel[index]) {
              setState(() => _educationLevel = '');
            } else {
              setState(() => _educationLevel = educationLevel[index]);
            }
          },
        ),
      ),
    );
  }
}
