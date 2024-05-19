import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:poll_dao/src/core/colors/app_colors.dart';
import 'package:poll_dao/src/core/extentions/extentions.dart';
import 'package:poll_dao/src/core/icons/app_icons.dart';
import 'package:poll_dao/src/features/create_poll/logic/create_poll_notifier.dart';
import 'package:poll_dao/src/features/create_poll/presentation/widgets/age_control_widget.dart';
import 'package:poll_dao/src/features/create_poll/presentation/widgets/check_biomrtric.dart';
import 'package:poll_dao/src/features/create_poll/presentation/widgets/gender_widget.dart';
import 'package:poll_dao/src/features/create_poll/presentation/widgets/peronal_information.dart';
import 'package:poll_dao/src/features/create_poll/presentation/widgets/text_widget.dart';
import 'package:poll_dao/src/features/education_level_page/presentation/pages/education_level_page.dart';
import 'package:poll_dao/src/features/language_page/presentation/pages/language_page.dart';
import 'package:poll_dao/src/features/location_page/presentation/pages/location_page.dart';
import 'package:poll_dao/src/features/nationality_page/presentation/pages/nationality_page.dart';

class AdvancedAudienceControl extends StatelessWidget {
  const AdvancedAudienceControl({
    super.key,
    this.padding = const EdgeInsets.all(20),
    this.safeAreaTop = true,
    this.title,
  });

  final EdgeInsets padding;
  final bool safeAreaTop;
  final String? title;

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<CreatePollNotifier>();
    return SafeArea(
      top: safeAreaTop,
      child: Padding(
        padding: padding,
        child: ExpansionTile(
          shape: const RoundedRectangleBorder(
            side: BorderSide.none,
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          maintainState: true,
          enableFeedback: true,
          backgroundColor: AppColors.c_F8F8FF,
          leading: !notifier.isAccordionOpen
              ? SvgPicture.asset(
                  AppImages.addIcon,
                  width: 24,
                  height: 24,
                )
              : null,
          title: Text(
            title ?? "Advanced Audience Control",
            style:
                const TextStyle(color: AppColors.black, fontSize: 17, fontWeight: FontWeight.w600, letterSpacing: 0.3),
          ),
          trailing:
              notifier.isAccordionOpen ? customTextWidget(text: "Reset", color: AppColors.c_5856D6) : const Text(''),
          children: [
            CheckBiometric(
              onChanged: (value) => notifier.toggleForVerifiedUsersOnly(value),
              value: notifier.forVerifiedUsersOnly,
              text: 'Exclusive voting only for users\nverified by biometric login',
              size: 17,
            ),
            15.ph,
            Align(alignment: Alignment.centerLeft, child: customTextWidget(text: "Gender", color: AppColors.black)),
            15.ph,
            SelectGenderWidget(
              selectedGender: notifier.selectedGender,
              onChanged: (value) => notifier.setSelectedGender(value),
            ),
            15.ph,
            Align(alignment: Alignment.centerLeft, child: customTextWidget(text: "Age", color: AppColors.black)),
            15.ph,
            AgeControlWidget(
              initialMinAge: notifier.minAge,
              initialMaxAge: notifier.maxAge,
              onMinAgeChanged: (int value) => notifier.setMinAge(value),
              onMaxAgeChanged: (int value) => notifier.setMaxAge(value),
            ),
            15.ph,
            PersonalInformation(
              hint: 'Select Location',
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) {
                return LocationPage(countries: notifier.selectedLocation);
              })).then((value) {
                if (value is String) {
                  notifier.setSelectedLocation(value);
                }
              }),
              title: 'Location',
              subTitle: notifier.selectedLocation,
            ),
            15.ph,
            PersonalInformation(
              hint: 'Select Education Level',
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) {
                return EducationLevelPage(educationLevels: notifier.selectedEducationLevel);
              })).then((value) {
                if (value is String) {
                  notifier.setSelectedEducationLevel(value);
                }
              }),
              title: 'Education Level',
              subTitle: notifier.selectedEducationLevel,
            ),
            15.ph,
            PersonalInformation(
              hint: 'Select Language',
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) {
                return LanguagePage(languages: notifier.selectedLanguage);
              })).then((value) {
                if (value is List<String>) {
                  notifier.setSelectedLanguage(value);
                }
              }),
              title: 'Language',
              subTitle: notifier.selectedLanguage.join(', '),
            ),
            15.ph,
            PersonalInformation(
              hint: 'Select nationality',
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) {
                return NationalityPage(nationalities: notifier.selectedNationality);
              })).then((value) {
                if (value is String) {
                  notifier.setSelectedNationality(value);
                }
              }),
              title: 'Nationality',
              subTitle: notifier.selectedNationality,
            ),
          ],
          onExpansionChanged: (bool expanded) {
            notifier.toggleAccordion(expanded);
          },
        ),
      ),
    );
  }
}
