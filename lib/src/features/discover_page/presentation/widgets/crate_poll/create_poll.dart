import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:poll_dao/src/core/colors/app_colors.dart';
import 'package:poll_dao/src/core/icons/app_icons.dart';
import 'package:poll_dao/src/features/discover_page/presentation/widgets/crate_poll/text_widget.dart';
import '../../../../widgets/base_bottom_sheet.dart';
Widget createPoll(BuildContext context) {
  return IconButton(
      onPressed: () {
        showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: AppColors.white,
            elevation: 0,
            context: context,
            builder: (context) => BaseBottomSheet(
              height: MediaQuery.sizeOf(context).height / 1.2,
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(right: 15, top: 15),
                            child: Align(
                                alignment: Alignment.bottomRight,
                                child: TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child:customTextWidget(text: "Done", color: AppColors.c_0D72FF)))),
                        customTextWidget(text: text, color: color),
                        //
                      ],
                    ),
                  )
                ],
              ),
            ));
      },
      icon: SvgPicture.asset(AppImages.add));
}