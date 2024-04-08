import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:poll_dao/src/core/colors/app_colors.dart';
import 'package:poll_dao/src/core/icons/app_icons.dart';
import 'package:poll_dao/src/features/discover_page/presentation/widgets/category_select.dart';
import 'package:poll_dao/src/features/discover_page/presentation/widgets/crate_poll/create_poll.dart';
import 'package:poll_dao/src/features/discover_page/presentation/widgets/options_answer.dart';
import 'package:poll_dao/src/features/discover_page/presentation/widgets/person_leading/person_leading.dart';
import '../widgets/active_polls_navigate.dart';
import '../widgets/voice.dart';

class DisCoverPage extends StatefulWidget {
  const DisCoverPage({super.key});

  @override
  State<DisCoverPage> createState() => _DisCoverPageState();
}

class _DisCoverPageState extends State<DisCoverPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: AppColors.secondary.withOpacity(0.9),
      appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.secondary.withOpacity(0.9),
          leading: personLeading(context),
          actions: [CreatePoll()]),
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 16,
            ),
          ),
          const SliverToBoxAdapter(
              child: Row(children: [
            Gap(25),
            Align(
                alignment: Alignment.centerLeft,
                child: Text("Discover",
                    style: TextStyle(
                        fontSize: 34, fontWeight: FontWeight.bold, color: AppColors.black)))
          ])),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 10,
            ),
          ),
          SliverToBoxAdapter(
              child: Column(children: [
            ActivePollsNavigate(
                radius: 20,
                color: AppColors.c_5856D6,
                textColorOne: AppColors.white,
                textColorTwo: AppColors.white.withOpacity(0.3),
                onTap: () {},
                icon: AppImages.arrowBackAndroidRight,
                textOne: '2 Active Polls',
                textTwo: 'See Details',
                textSizeOne: 20,
                textSizeTwo: 15,
                fontWeightTextOne: FontWeight.w600,
                fontWeightTextTwo: FontWeight.w400)
          ])),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(
                  height: 45,
                  child: SelectCategory(theme, () {}),
                )
              ],
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          ),
          SliverToBoxAdapter(
              child: Column(children: [
            Voice(onTap: () {}),
            BuildButton(onTap: () {}),
            Voice(onTap: () {}),
            Voice(onTap: () {}),
            Voice(onTap: () {}),
            BuildButton(onTap: () {}),
            Voice(onTap: () {}),
            Voice(onTap: () {}),
            BuildButton(onTap: () {}),
            Voice(onTap: () {}),
            Voice(onTap: () {}),
            BuildButton(onTap: () {}),
            BuildButton(onTap: () {}),
            BuildButton(onTap: () {}),
          ])),
        ],
      ),
    );
  }
}
