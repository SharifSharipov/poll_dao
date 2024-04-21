import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:poll_dao/src/config/routes/routes.dart';
import 'package:poll_dao/src/core/colors/app_colors.dart';
import 'package:poll_dao/src/core/extentions/extentions.dart';
import 'package:poll_dao/src/core/icons/app_icons.dart';
import 'package:poll_dao/src/features/create_poll/presentation/widgets/check_biomrtric.dart';
import 'package:poll_dao/src/features/create_poll/presentation/widgets/gender_widget.dart';
import 'package:poll_dao/src/features/create_poll/presentation/widgets/peronal_information.dart';
import 'package:poll_dao/src/features/create_poll/presentation/widgets/text_widget.dart';

class AdvancedAudienceControl extends StatefulWidget {
  const AdvancedAudienceControl({super.key});

  @override
  _AdvancedAudienceControlState createState() => _AdvancedAudienceControlState();
}

class _AdvancedAudienceControlState extends State<AdvancedAudienceControl> {
  bool isAccordionOpen = false;
  bool isSelectedOne = false;
  bool isSelectedTwo = false;
  bool isSelectedThree = false;
  bool isSelectedFour = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: ExpansionTile(
        shape: const RoundedRectangleBorder(
          side: BorderSide.none,
          //  borderRadius: BorderRadius.circular(12),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        maintainState: true,
        enableFeedback: true,
        backgroundColor: AppColors.secondary,
        leading: !isAccordionOpen
            ? SvgPicture.asset(
                AppImages.addIcon,
                width: 24,
                height: 24,
              )
            : const Text(""),
        title: const Text(
          "Advanced Audience Control",
          style: TextStyle(
              color: AppColors.black,
              fontSize: 17,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.3),
        ),
        trailing: const Text(
            "") /*: Padding(
          padding: const EdgeInsets.only(
            left: 20,
          ),
          child: Align(
              alignment: Alignment.centerLeft,
              child:
              customTextWidget(text: "Reset", color: AppColors.black)),
        )*/
        ,
        children: <Widget>[
          15.ph,
          const CheckBiometric(
            value: false,
            text: 'Exclusive voting only for users\nverified by biometric login',
            size: 17,
          ),
          15.ph,
          Align(
              alignment: Alignment.centerLeft,
              child: customTextWidget(text: "Gender", color: AppColors.black)),
          15.ph,
          Gender(
            onTapOne: () {
              setState(() {
                isSelectedOne = !isSelectedOne;
              });
            },
            onTapTwo: () {
              setState(() {
                isSelectedTwo = !isSelectedTwo;
              });
            },
            onTapThree: () {
              setState(() {
                isSelectedThree = !isSelectedThree;
              });
            },
            onTapFour: () {
              setState(() {
                isSelectedFour = !isSelectedFour;
              });
            },
            isSelectedOne: isSelectedOne,
            isSelectedTwo: isSelectedTwo,
            isSelectedThree: isSelectedThree,
            isSelectedFour: isSelectedFour,
          ),
          15.ph,
          PersonalInformation(
            onTap: () {
              Navigator.pushNamed(context, RouteNames.locationPage);
            },
            textOne: 'Location',
            textTwo: 'German',
          ),
          15.ph,
          PersonalInformation(
            onTap: () {
              Navigator.pushNamed(context, RouteNames.educationLevelPage);
            },
            textOne: 'Education Level',
            textTwo: 'All',
          ),
          15.ph,
          PersonalInformation(
            onTap: () {
              Navigator.pushNamed(context, RouteNames.languagePage);
            },
            textOne: 'Language',
            textTwo: 'French',
          ),
          15.ph,
          PersonalInformation(
            onTap: () {
              Navigator.pushNamed(context, RouteNames.nationalityPage);
            },
            textOne: 'Nationality',
            textTwo: 'Russian,Ukrainian,Uzbek',
          ),
        ],
        onExpansionChanged: (bool expanded) {
          setState(() {
            isAccordionOpen = expanded;
          });
        },
      ),
    );
  }
}
