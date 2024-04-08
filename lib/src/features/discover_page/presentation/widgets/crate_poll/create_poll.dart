import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:poll_dao/src/core/colors/app_colors.dart';
import 'package:poll_dao/src/core/extentions/extentions.dart';
import 'package:poll_dao/src/core/icons/app_icons.dart';
import 'package:poll_dao/src/features/discover_page/presentation/widgets/crate_poll/add_options.dart';
import 'package:poll_dao/src/features/discover_page/presentation/widgets/crate_poll/advanced_audince_control.dart';
import 'package:poll_dao/src/features/discover_page/presentation/widgets/crate_poll/custom_new_poll_navigate.dart';
import 'package:poll_dao/src/features/discover_page/presentation/widgets/crate_poll/insert_ansver_button.dart';
import 'package:poll_dao/src/features/discover_page/presentation/widgets/crate_poll/new_poll_text_field.dart';
import 'package:poll_dao/src/features/discover_page/presentation/widgets/crate_poll/select_question_type.dart';
import 'package:poll_dao/src/features/discover_page/presentation/widgets/crate_poll/text_widget.dart';
import '../../../../widgets/base_bottom_sheet.dart';
class CreatePoll extends StatefulWidget {
  const CreatePoll({super.key});

  @override
  State<CreatePoll> createState() => _CreatePollState();
}

class _CreatePollState extends State<CreatePoll> {
  @override
  Widget build(BuildContext context) {
    TextEditingController controllerOne = TextEditingController();
    TextEditingController controllerTwo = TextEditingController();
    double width = MediaQuery.of(context).size.width;
    int count=0;
    return IconButton(
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: AppColors.c_C8E8FA,
              elevation: 0,
              context: context,
              builder: (context) => BaseBottomSheet(
                height: MediaQuery.sizeOf(context).height / 1.2,
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Column(
                        children: [
                          15.ph,
                          customNewPollNavigate(context),
                          20.ph,
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                            ),
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child:
                                customTextWidget(text: "Question", color: AppColors.black)),
                          ),
                          10.ph,
                          BaseNewPollTextField(
                            hintText: 'Ask question  ',
                            controller: controllerOne,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                            ),
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: customTextWidget(text: "Options", color: AppColors.black)),
                          ),
                          InsertAnswer(count: 3, hintText: 'Options questions', onTapOne: () {  }, onTapTwo: () {  }, controller: controllerOne,),
                          30.ph,
                          AddOptions(
                            onTap: () {
                              count++;
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
                                                    fontWeight: FontWeight.w500),
                                              ),
                                            ],
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                          0.1.ph,
                                          SelectQuestionWidget(
                                            text: "Image",
                                            data: [SvgPicture.asset(AppImages.imageSelect)],
                                            onTap: () {
                                              Navigator.pop(context);
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
                                                    fontWeight: FontWeight.w500),
                                              ),
                                              SvgPicture.asset(AppImages.imageSelect),
                                            ],
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                              setState(() {

                              });
                            },
                          ),
                          30.ph,
                          AdvancedAudienceControl(),

                        ],
                      ),
                    )
                  ],
                ),
              ),
          );
        },
        icon: SvgPicture.asset(AppImages.add),
    );
  }
}


