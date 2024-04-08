import 'package:flutter/material.dart';
import 'package:poll_dao/src/core/extentions/extentions.dart';
import 'package:poll_dao/src/features/discover_page/presentation/widgets/data_select.dart';
import 'package:poll_dao/src/features/discover_page/presentation/widgets/person_data_select.dart';
import 'package:poll_dao/src/features/widgets/base_textfield.dart';

import '../../../../core/colors/app_colors.dart';
import '../../../../core/icons/app_icons.dart';

Widget ProfileWidget({required BuildContext context}) {
  return Column(
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
        hintText: '..........',
        text: 'Password',
        icon: AppImages.clock,
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
        columnData: [
          DataSelect(
            onTap: () {},
            text: 'Male',
          ),
          DataSelect(
            onTap: () {},
            text: 'Female',
          ),
        ],
      ),
      PersonData(
        textOne: 'Education Level',
        textTwo: 'ex, primary education',
        icon: AppImages.education,
        columnData: [
          DataSelect(
            onTap: () {},
            text: 'Student',
          ),
          DataSelect(
            onTap: () {},
            text: 'Master\'s degree',
          ),
          DataSelect(
            onTap: () {},
            text: 'Doctor',
          ),
        ],
      ),
      PersonData(
        textOne: 'Location',
        textTwo: 'German',
        icon: AppImages.location,
        columnData: [
          DataSelect(
            onTap: () {},
            text: 'Uzbekistan',
          ),
          DataSelect(
            onTap: () {},
            text: 'Tajikistan',
          ),
          DataSelect(
            onTap: () {},
            text: 'Kazakhstan',
          ),
          DataSelect(
            onTap: () {},
            text: 'Kyrgyzstan',
          ),
          DataSelect(
            onTap: () {},
            text: 'Turkmenistan',
          ),
          DataSelect(
            onTap: () {},
            text: 'Afghanistan',
          ),
          DataSelect(
            onTap: () {},
            text: 'Russia',
          ),
          DataSelect(
            onTap: () {},
            text: 'Belarus',
          ),
          DataSelect(
            onTap: () {},
            text: 'United States',
          ),
          DataSelect(
            onTap: () {},
            text: 'Turkey',
          ),
        ],
      ),
      PersonData(
        textOne: 'Nationality ',
        textTwo: 'ex, German',
        icon: AppImages.nationality,
        columnData: [
          DataSelect(
            onTap: () {},
            text: 'Uzbek',
          ),
          DataSelect(
            onTap: () {},
            text: 'Tajik',
          ),
          DataSelect(
            onTap: () {},
            text: 'Kazakh',
          ),
          DataSelect(
            onTap: () {},
            text: 'Kyrgyz',
          ),
          DataSelect(
            onTap: () {},
            text: 'Turkmen',
          ),
          DataSelect(
            onTap: () {},
            text: 'Persian',
          ),
          DataSelect(
            onTap: () {},
            text: 'Russian',
          ),
          DataSelect(
            onTap: () {},
            text: 'Belarusian',
          ),
          DataSelect(
            onTap: () {},
            text: 'English',
          ),
          DataSelect(
            onTap: () {},
            text: 'Turkish',
          ),
        ],
      ),
      60.ph,
      const Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            "Change Password",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: AppColors.black),
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
  );
}
