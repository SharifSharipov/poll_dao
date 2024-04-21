import 'package:flutter/material.dart';
import 'package:poll_dao/src/core/colors/app_colors.dart';
import 'package:poll_dao/src/features/active_polls_page/presentation/widget/indicator.dart';

class ActivePollsPageWidgets extends StatefulWidget {
  const ActivePollsPageWidgets({super.key});

  @override
  State<ActivePollsPageWidgets> createState() => _ActivePollsPageWidgetsState();
}

class _ActivePollsPageWidgetsState extends State<ActivePollsPageWidgets> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: Container(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "LAST VOTED 12 MINUTES AGO ",
                style:
                    TextStyle(fontSize: 12, color: AppColors.c_111111, fontWeight: FontWeight.w400),
              ),
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Epicurus in liberos atque integre",
                style: TextStyle(fontSize: 17, color: AppColors.black, fontWeight: FontWeight.bold),
              ),
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "iudicante itaque negat opus esse.",
                style: TextStyle(fontSize: 17, color: AppColors.black, fontWeight: FontWeight.bold),
              ),
            ),
            Divider(
              color: AppColors.black.withOpacity(0.3),
            ),
            const ChargePercentageIndicator(
                chargePercentage: 30, option: 'A', text: 'Netflix & Chill 🍿'),
            const ChargePercentageIndicator(
                chargePercentage: 69, option: 'B', text: 'Visit a bar 🍺'),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "55 Total Votes",
                style:
                    TextStyle(fontSize: 12, color: AppColors.c_111111, fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
