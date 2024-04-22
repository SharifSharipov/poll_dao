import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:poll_dao/src/config/routes/routes.dart';
import 'package:poll_dao/src/core/colors/app_colors.dart';
import 'package:poll_dao/src/core/extentions/extentions.dart';
import 'package:poll_dao/src/core/icons/app_icons.dart';
import 'package:poll_dao/src/features/create_poll/presentation/pages/create_poll_page.dart';
import 'package:poll_dao/src/features/create_poll/presentation/widgets/select_question_type.dart';
import 'package:poll_dao/src/features/discover_page/presentation/widgets/category_select.dart';
import 'package:poll_dao/src/features/discover_page/presentation/widgets/options_answer.dart';
import 'package:poll_dao/src/features/discover_page/presentation/widgets/show_dialog.dart';
import 'package:poll_dao/src/features/profile_page/domain/service/service.dart';
import 'package:poll_dao/src/features/profile_page/presentation/pages/profile_page.dart';
import 'package:poll_dao/src/features/sign_in_page/presentation/pages/sign_in_page.dart';
import 'package:poll_dao/src/features/sign_up_page/presentation/pages/sign_up_page.dart';
import '../widgets/active_polls_navigate.dart';
import '../widgets/voice.dart';

class DisCoverPage extends StatefulWidget {
  const DisCoverPage({super.key});

  @override
  State<DisCoverPage> createState() => _DisCoverPageState();
}

class _DisCoverPageState extends State<DisCoverPage> {
  bool isVoice = true;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
   /*   floatingActionButton: FloatingActionButton(
        onPressed: () {
          Service().sendProfileData(oldPassword: '12345678', newPassword: 'newPassword').then((value) {
            print(value);
          }).onError((error, stackTrace) {
            print(error.toString()+" "+stackTrace.toString());

          });
        }
      ),*/
      backgroundColor:const Color(0xffF0F3FA),
      appBar: AppBar(
          elevation: 0,
          backgroundColor:const Color(0xffF0F3FA),
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30), color: AppColors.c_C8E8FA),
                child: IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: AppColors.white,
                          elevation: 0,
                          context: context,
                          builder: (context) => const ProfilePage());
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
                    builder: (context) => const CreatePollPage());
              },
              icon: SvgPicture.asset(AppImages.add),
            )
          ]),
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
                textColorTwo: AppColors.white.withOpacity(0.7),
                onTap: () {
                  Navigator.pushNamed(context, RouteNames.activePollsPage);
                },
                icon: AppImages.arrowBackAndroidRight,
                textOne: '2 Active Polls',
                textTwo: 'See Details',
                textSizeOne: 20,
                textSizeTwo: 15,
                fontWeightTextOne: FontWeight.w600,
                fontWeightTextTwo: FontWeight.w500)
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
                  child:SelectCategory(selectColor: isVoice, onTap: () {
                    setState(() {
                      isVoice=!isVoice;
                    });
                  },),
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
            const VoiceWidget(),
            BuildButtonWidget(context),
            const VoiceWidget(),
            const VoiceWidget(),
            const VoiceWidget(),
            BuildButtonWidget(context),
            const VoiceWidget(),
            const VoiceWidget(),
            BuildButtonWidget(context),
            const VoiceWidget(),
            const VoiceWidget(),
            BuildButtonWidget(context),
            BuildButtonWidget(context),
            BuildButtonWidget(context),
          ])),
        ],
      ),
    );
  }
}
class VoiceWidget extends StatefulWidget {
  const VoiceWidget({super.key});

  @override
  State<VoiceWidget> createState() => _VoiceWidgetState();
}

class _VoiceWidgetState extends State<VoiceWidget> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Voice(onTap: () {
      PollshowDialog(
          context: context,
          onTapOne: () {
            showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: AppColors.white,
                elevation: 0,
                context: context,
                builder: (context) => const SignUpPage());
          },
          onTapTwo: () {
            showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: AppColors.white,
                elevation: 0,
                context: context,
                builder: (context) => const SignInPage());
          },
          onTapThree: () {
            Navigator.pop(context);
          });
    }, onTapTwo: () {    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: Padding(
            padding: EdgeInsets.only(left: width / 3),
            child: CupertinoActionSheet(
              actions: <Widget>[

                0.1.ph,
                SelectQuestionWidget(
                  text: "Change choice",
                  data: [SvgPicture.asset(AppImages.returnNer)],
                  onTap: () {
                    setState(() {
                      Navigator.pop(context);
                    });
                  },
                ),
                0.1.ph,
                SelectQuestionWidget(
                  text: 'Delete',
                  data: [
                    SvgPicture.asset(AppImages.deleteBlack),
                  ],
                  onTap: () {
                    setState(() {
                      Navigator.pop(context);
                    });
                  },
                ),
              ],
            ),
          ),
        );
      },
    ); },);
  }
}


Widget BuildButtonWidget(BuildContext context) {
  return BuildButton(onTap: () {
    PollshowDialog(
        context: context,
        onTapOne: () {
          showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: AppColors.white,
              elevation: 0,
              context: context,
              builder: (context) => const SignUpPage());
        },
        onTapTwo: () {
          showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: AppColors.white,
              elevation: 0,
              context: context,
              builder: (context) => const SignInPage());
        },
        onTapThree: () {
          Navigator.pop(context);
        });
  });
}
