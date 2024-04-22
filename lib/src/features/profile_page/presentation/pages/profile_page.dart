import 'package:flutter/material.dart';
import 'package:poll_dao/src/config/routes/routes.dart';
import 'package:poll_dao/src/core/colors/app_colors.dart';
import 'package:poll_dao/src/core/extentions/extentions.dart';
import 'package:poll_dao/src/core/icons/app_icons.dart';
import 'package:poll_dao/src/features/profile_page/presentation/widgets/peronal_information.dart';
import 'package:poll_dao/src/features/widgets/base_bottom_sheet.dart';
import '../../../widgets/base_textfield.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return BaseBottomSheet(
        height: height,
        backgroundColor: AppColors.white,
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
                              child: const Text('Done',
                                  style: TextStyle(color: AppColors.c_0D72FF, fontSize: 17))))),
                  const BaseTextField(
                    hintText: 'emirerdo@yandex.com',
                    text: 'Email Address',
                    icon: AppImages.email,
                  ),
                  const BaseTextField(
                    hintText: 'Aaron Alarmaz',
                    text: 'Username',
                    icon: AppImages.user,
                  ),
                  const BaseTextField(
                    hintText: '18',
                    text: 'Age',
                    icon: AppImages.age,
                  ),
                  PersonData(
                    textOne: 'Gender',
                    textTwo: 'Male',
                    icon: AppImages.gender,
                    onTap: () {},
                  ),
                  PersonData(
                    textOne: 'Education Level',
                    textTwo: 'ex, primary education',
                    icon: AppImages.education,
                    onTap: () {
                      Navigator.pushNamed(context, RouteNames.educationLevelPage);
                    },
                  ),
                  PersonData(
                    textOne: 'Location',
                    textTwo: 'German',
                    icon: AppImages.location,
                    onTap: () {
                      Navigator.pushNamed(context, RouteNames.locationPage);
                    },
                  ),
                  PersonData(
                    textOne: 'Nationality ',
                    textTwo: 'ex, German',
                    icon: AppImages.nationality,
                    onTap: () {
                      Navigator.pushNamed(context, RouteNames.nationalityPage);
                    },
                  ),
                  60.ph,
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        "Change Password",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600, color: AppColors.black),
                      ),
                    ),
                  ),
                  const BaseTextField(
                    hintText: '*********',
                    text: 'Old password',
                    icon: AppImages.oldPassword,
                  ),
                  const BaseTextField(
                    hintText: '*********',
                    text: 'New password',
                    icon: AppImages.newPassword,
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
