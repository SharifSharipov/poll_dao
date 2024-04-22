
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poll_dao/src/core/colors/app_colors.dart';
import 'package:poll_dao/src/core/extentions/extentions.dart';
import 'package:poll_dao/src/core/icons/app_icons.dart';
import 'package:poll_dao/src/features/discover_page/presentation/pages/dicover_page.dart';
import 'package:poll_dao/src/features/profile_page/domain/repositories/repository.dart';
import 'package:poll_dao/src/features/profile_page/domain/service/service.dart';
import 'package:poll_dao/src/features/profile_page/presentation/manager/fetch_profile_data_bloc/fetch_profile_data_bloc.dart';
import 'package:poll_dao/src/features/profile_page/presentation/widgets/peronal_information.dart';
import 'package:poll_dao/src/features/widget_servers/status/status.dart';
import 'package:poll_dao/src/features/widgets/base_bottom_sheet.dart';
import 'package:poll_dao/src/features/widgets/base_textfield.dart';

import '../../../../config/routes/routes.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    // final changePasswordBloc = BlocProvider.of<ChangePasswordBloc>(context);
    return BlocListener<FetchProfileDataBloc, FetchProfileDataState>(
      listener: (context, state) {
        if (state.status == FormStatus.success) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const DisCoverPage()),
          );
        }
      },
      child: BlocBuilder<FetchProfileDataBloc, FetchProfileDataState>(
        builder: (context, state) {
          final fetchProfileDataBloc = BlocProvider.of<FetchProfileDataBloc>(context);
          print(state.profileModel.name);
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
                                      fetchProfileDataBloc.add(UpdateProfilePressed());
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Done',
                                        style: TextStyle(
                                            color: AppColors.c_0D72FF, fontSize: 17))))),
                        const BaseTextField(
                          hintText: "andrey@example.com",
                          text: 'Email Address',
                          icon: AppImages.email,
                        ),
                        BaseTextField(
                          hintText: state.profileModel.name ?? '',
                          text: 'Username',
                          icon: AppImages.user,
                          controller: fetchProfileDataBloc.nameController,
                        ),
                        BaseTextField(
                          hintText: state.profileModel.age.toString() ?? '',
                          text: 'Age',
                          icon: AppImages.age,
                          controller: fetchProfileDataBloc.ageController,
                        ),
                        PersonData(
                          textOne: 'Gender',
                          textTwo: state.profileModel.gender ?? '',
                          icon: AppImages.gender,
                          onTap: () {},
                        ),
                        PersonData(
                          textOne: "Education",
                          textTwo:state.profileModel.education ?? "",
                          icon: AppImages.education,
                          onTap: () {
                            Navigator.pushNamed(context, RouteNames.educationLevelPage);
                          },
                        ),
                        PersonData(
                          textOne: "Location",
                          textTwo: context.watch<FetchProfileDataBloc>().state.profileModel.location?? "",
                          icon: AppImages.location,
                          onTap: () {
                            Navigator.pushNamed(context, RouteNames.locationPage);
                          },
                        ),
                        PersonData(
                          textOne: "Nationality",
                          textTwo: context.watch<FetchProfileDataBloc>().state.profileModel.nationality?? "",
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
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.black),
                            ),
                          ),
                        ),
                        BaseTextField(
                          hintText: '*********',
                          text: 'Old password',
                          icon: AppImages.oldPassword,
                          controller: fetchProfileDataBloc.oldPasswordController,
                        ),
                        BaseTextField(
                          hintText: '*********',
                          text: 'New password',
                          icon: AppImages.newPassword,
                          controller: fetchProfileDataBloc.newPasswordController,
                        ),
                      ],
                    ),
                  )
                ],
              ));
        },
      ),
    );
  }
}
