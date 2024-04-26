import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:poll_dao/src/core/extentions/extentions.dart';
import 'package:poll_dao/src/core/icons/app_icons.dart';
import 'package:poll_dao/src/features/create_poll/presentation/manager/cubits/index_cibit/index_cubit.dart';
import 'package:poll_dao/src/features/create_poll/presentation/widgets/answer_button.dart';
import '../../../../core/colors/app_colors.dart';

class GeneRationTextField extends StatefulWidget {
  const GeneRationTextField({
    super.key,
  });

  @override
  State<GeneRationTextField> createState() => _GeneRationTextFieldState();
}

class _GeneRationTextFieldState extends State<GeneRationTextField> {
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
    double width = MediaQuery.of(context).size.width;
    return BlocProvider(
        create: (context) => IndexCubit(),
        child: BlocBuilder<IndexCubit, int>(
          builder: (context, state) {
            return SliverVisibility(
              visible: true,
              sliver: SliverToBoxAdapter(
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
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ));
  }
}

// const SliverToBoxAdapter(child: SizedBox(height: 20,),),
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
/*    SliverToBoxAdapter(
                      child: Column(
                        children: [
                          AddOptions(
                            onTap: () {

                              showCupertinoDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Center(
                                    child: Padding(
                                      padding: EdgeInsets.only(right: width / 2.3),
                                      child: CupertinoActionSheet(
                                        actions: <Widget>[
                                          0.1.ph,
                                          SelectQuestionWidget(
                                            text: "Text",
                                            data: const [
                                              Text(
                                                "Aa",
                                                style: TextStyle(
                                                  color: AppColors.c_111111,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                            onTap: () {
                                              setState(() {
                                                Navigator.pop(context);
                                              });
                                            },
                                          ),
                                          0.1.ph,
                                          SelectQuestionWidget(
                                            text: "Image",
                                            data: [SvgPicture.asset(AppImages.imageSelect)],
                                            onTap: () {
                                              isImage = !isImage;
                                              setState(() {

                                              });
                                              Navigator.pop(context);
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) => CreatePollPage(
                                                    isImage: !isImage, // isImage qiymatini o'zgartirish
                                                  ),
                                                ),
                                              );

                                            },
                                          ),
                                          0.1.ph,
                                          SelectQuestionWidget(
                                            text: 'Text+Image',
                                            data: [
                                              const Text(
                                                "Aa",
                                                style: TextStyle(
                                                  color: AppColors.c_111111,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              SvgPicture.asset(AppImages.imageSelect),
                                            ],
                                            onTap: () {
                                              isImage = !isImage;
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                              setState(() {});
                            },
                          ),
                          30.ph,
                          AdvancedAudienceControl(),
                        ],
                      ),
                    )*/
/* ListView.separated(
                                  itemBuilder: (BuildContext context, int index) {
                                    return Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(top: 14),
                                          child: AnswerButtonFon(
                                            answer:answerList[index],
                                            onTap:(){},
                                          ),
                                        ),
                                        20.pw,
                                        Expanded(
                                          child: TextField(
                                            controller: textControllers[index],
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: 'Option ${index + 1}',
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
                                        IconButton(
                                            onPressed: (){},
                                            icon: SvgPicture.asset(
                                              AppImages.cancel,
                                              width: 20,
                                            )),
                                        IconButton(
                                            onPressed:(){},
                                            icon: SvgPicture.asset(
                                              AppImages.graber,
                                              width: 30,
                                            )),
                                      ],
                                    );
                                  },
                                  separatorBuilder: (BuildContext context, int index) {
                                    return Padding(
                                      padding: EdgeInsets.only(left:width/7 ),
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
                                ),*/
