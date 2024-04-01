import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:poll_dao/src/core/colors/app_colors.dart';
import 'package:poll_dao/src/core/icons/app_icons.dart';
import '../widgets/voice.dart';

class DisCoverPage extends StatefulWidget {
  const DisCoverPage({super.key});

  @override
  State<DisCoverPage> createState() => _DisCoverPageState();
}

class _DisCoverPageState extends State<DisCoverPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.secondary.withOpacity(0.9),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.secondary.withOpacity(0.9),
        leading: Padding(
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
                        builder: (context) => Container(
                              height: height * 0.9,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.red, width: 2),
                                  borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(20),
                                  ),
                                  color: Theme.of(context).canvasColor),
                            ));
                  },
                  icon: SvgPicture.asset(AppImages.user))),
        ),
        actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: AppColors.white,
                    elevation: 0,
                    context: context,
                    builder: (context) => Container(
                          height: height * 0.9,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.red, width: 2),
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(20),
                              ),
                              color: Theme.of(context).canvasColor),
                        ));
              },
              icon: SvgPicture.asset(AppImages.add)),
        ],
      ),
      body: const CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: 16,
            ),
          ),
          SliverToBoxAdapter(
              child: Column(children: [
            Voice(),
            Voice(),
            Voice(),
            Voice(),
            Voice(),
            Voice(),
            Voice(),
            Voice(),
          ])),
        ],
      ),
    );
  }
}
