import 'package:accordion/accordion.dart';
import 'package:custom_accordion/custom_accordion.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:poll_dao/src/core/colors/app_colors.dart';
import 'package:poll_dao/src/core/extentions/extentions.dart';
import 'package:poll_dao/src/core/icons/app_icons.dart';

import '../../../discover_page/presentation/widgets/person_data_select.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In"),
      ),
      body: ListView(
        children: [Column(
          children: [
            /*   Container(
              padding: const EdgeInsets.all(30).copyWith(left: 20),
              decoration: BoxDecoration(
                color: AppColors.c_F0F3FA,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.white,
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              AppImages.gender,
                              width: 30,
                              height: 30,
                            ),
                          ),
                        ),
                        const Gap(30),
                        Expanded(
                          child: RichText(
                            text: const TextSpan(
                              style: TextStyle(
                                fontSize: 24.0,
                                color: Colors.black,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Merhaba, ',
                                ),
                                TextSpan(
                                  text: '\ndünya!',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        AppImages.arrowBackIosRight,
                        width: 24,
                        height: 24,
                      ))
                ],
              ),
            ),*/
            20.ph,
            Accordion(
              paddingListTop: 3,
              paddingListBottom: 3,
              children: [
                AccordionSection(
                  header: Container(
                    height: 40,
                 /*     padding: const EdgeInsets.all(30).copyWith(left: 20),*/
                      decoration: BoxDecoration(
                          /*color: AppColors.c_F0F3FA,*/ borderRadius: BorderRadius.circular(12)),
                      child: Text("helllo")),
                  content: Text("content"),
                )
              ], /*headerBackgroundColor: AppColors.c_F0F3FA*/
            ),
            20.ph,
            Accordion(
              paddingListTop: 3,
              paddingListBottom: 3,
              children: [
                AccordionSection(
                  header: Container(
                    padding: EdgeInsets.all(30).copyWith(left: 20), // Paddingni o'zgartiring
                    decoration: BoxDecoration(
                      color: AppColors.c_F0F3FA,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text("helllo"),
                  ),
                  content: Text("content"),
                )
              ],
            ),
            CustomAccordion(
              title: 'Accordion with one child',
              subTitle: 'Accordion Sub Title',
              headerBackgroundColor: Colors.blue,
              titleStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              subTitleStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
              toggleIconOpen: Icons.keyboard_arrow_down_sharp,
              toggleIconClose: Icons.keyboard_arrow_up_sharp,
              headerIconColor: Colors.white,
              accordionElevation: 0,
              widgetItems: const Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                child: Row(
                  children: [
                    CustomAccordion(

                      title: 'Accordion with many child',
                      headerBackgroundColor: Colors.blue,
                      titleStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      toggleIconOpen: Icons.keyboard_arrow_down_sharp,
                      toggleIconClose: Icons.keyboard_arrow_up_sharp,
                      headerIconColor: Colors.white,
                      accordionElevation: 0,
                      widgetItems: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Lorem Ipsum',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text(
                              'ELEVATED BUTTON',
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomAccordion(
                title: 'Accordion with List Items',
                subTitle: 'Accordion toggle disabled',
                headerBackgroundColor: Colors.blue,
                titleStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                subTitleStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                ),
                toggleIconOpen: Icons.keyboard_arrow_down_sharp,
                toggleIconClose: Icons.keyboard_arrow_up_sharp,
                headerIconColor: Colors.white,
                accordionElevation: 0,
                disableToggle: true,
                widgetItems: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: List<Widget>.generate(5, (int index) {
                    return Text('Item $index');
                  }),
                ),
              ),
            ),
       /*     const PersonData(
              textOne: 'Hello',
              textTwo: 'Tashkent',
              icon: AppImages.age,
            ),*/
          ],
        )],
      ),
    );
  }
}
