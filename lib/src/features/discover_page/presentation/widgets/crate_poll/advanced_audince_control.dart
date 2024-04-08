import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:poll_dao/src/core/colors/app_colors.dart';
import 'package:poll_dao/src/core/icons/app_icons.dart';

class AdvancedAudienceControl extends StatefulWidget {
  const AdvancedAudienceControl({Key? key}) : super(key: key);

  @override
  _AdvancedAudienceControlState createState() => _AdvancedAudienceControlState();
}

class _AdvancedAudienceControlState extends State<AdvancedAudienceControl> {
  bool isAccordionOpen = false;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(left: 20),
      child: ExpansionTile(
        shape:const RoundedRectangleBorder(
          side: BorderSide.none,
        //  borderRadius: BorderRadius.circular(12),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        maintainState: true,
        enableFeedback: true,
        backgroundColor:AppColors.secondary,
        leading:SvgPicture.asset(
            AppImages.addIcon,
            width: 24,
            height: 24,
        ),
        title: const Text(
          "Advanced Audience Control",
          style: TextStyle(
              color: AppColors.c_0D72FF,
              fontSize: 17,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.3),
        ),
        trailing:const Text(""),
        children:<Widget> [
          Text("jjrtklejr 34"),
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
