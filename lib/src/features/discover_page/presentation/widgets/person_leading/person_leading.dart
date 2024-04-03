import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:poll_dao/src/core/colors/app_colors.dart';
import 'package:poll_dao/src/core/icons/app_icons.dart';
import 'package:poll_dao/src/features/discover_page/presentation/widgets/profile_wideget.dart';
import 'package:poll_dao/src/features/widgets/base_bottom_sheet.dart';

Widget personLeading(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(30), color: AppColors.c_C8E8FA),
        child: IconButton(
            onPressed: () {
              showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: AppColors.white,
                  elevation: 0,
                  context: context,
                  builder: (context) => BaseBottomSheet(
                      height: MediaQuery.sizeOf(context).height * 0.9,
                      child: CustomScrollView(
                        slivers: [
                          SliverToBoxAdapter(
                              child: Column(children: [ProfileWidget(context: context)]))
                        ],
                      )));
            },
            icon: SvgPicture.asset(AppImages.user))),
  );
}
