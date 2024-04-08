import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:poll_dao/src/core/colors/app_colors.dart';
import 'package:poll_dao/src/core/extentions/extentions.dart';
import 'package:poll_dao/src/core/icons/app_icons.dart';
import 'package:poll_dao/src/features/create_poll/presentation/manager/cubits/index_cibit/index_cubit.dart';
import 'package:poll_dao/src/features/create_poll/presentation/widgets/answer_button.dart';
import 'package:poll_dao/src/features/widgets/base_bottom_sheet.dart';

class ExperienceScreen extends StatefulWidget {
  const ExperienceScreen({super.key});

  @override
  State<ExperienceScreen> createState() => _ExperienceScreenState();
}

class _ExperienceScreenState extends State<ExperienceScreen> {
  List<TextEditingController> textControllers = [TextEditingController()];
  final controllerOne = TextEditingController();
  bool isImage = true;
  @override
  void initState() {
    super.initState();
    textControllers = [TextEditingController()];
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return BlocProvider(
        create: (context) => IndexCubit(),
        child: BlocBuilder<IndexCubit, int>(
          builder: (context, state) {
            print("state: $state");
            return ListView(
              children: [
                Visibility(
                  visible: true,
                  child: SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Container(
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColors.white,
                        ),
                        child: Column(
                          children: [
                            20.ph,
                            ListView.separated(
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.only(left: 15, right: 10),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 14),
                                        child: AnswerButtonFon(
                                          answer: answerList[index],
                                          onTap: () {},
                                        ),
                                      ),
                                      20.pw,
                                      Expanded(
                                        child: TextField(
                                          controller: textControllers[index],
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            hintText: 'Option text',
                                          ),
                                          onChanged: (value) {
                                            if (index == textControllers.length - 1 &&
                                                value.isNotEmpty) {
                                              setState(() {
                                                textControllers.add(TextEditingController());
                                              });
                                            }
                                          },
                                        ),
                                      ),
                                      textControllers[index].text.isNotEmpty
                                          ? IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  textControllers[index].clear();
                                                });
                                              },
                                              icon: SvgPicture.asset(
                                                AppImages.cancel,
                                                width: 20,
                                              ),
                                            )
                                          : const SizedBox(),
                                      IconButton(
                                          onPressed: () {},
                                          icon: SvgPicture.asset(
                                            AppImages.graber,
                                            width: 30,
                                          )),
                                    ],
                                  ),
                                );
                              },
                              separatorBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: EdgeInsets.only(left: width / 7),
                                  child: const Divider(
                                    color: AppColors.c_A0A4A7,
                                    height: 1,
                                    thickness: 1,
                                  ),
                                );
                              },
                              itemCount: textControllers.length,
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 20,
                  ),
                ),
              ],
            );
          },
        ));
  }
}

List<String> answerList = [
  "A",
  "B",
  "C",
  "D",
  "E",
  "F",
  "G",
  "H",
  "I",
  "J",
  "K",
  "L",
  "M",
  "N",
  "O",
  "P",
  "Q",
  "R",
  "S",
  "T",
  "U",
  "V",
  "W",
  "X",
  "Y",
  "Z"
];
