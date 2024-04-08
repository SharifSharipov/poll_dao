import 'package:flutter/material.dart';
import 'package:poll_dao/src/core/icons/app_icons.dart';

import '../../../../core/colors/app_colors.dart';
import '../../../widgets/golobal_text_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController paswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
      ),
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: SizedBox(height: 16),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                // CaruselSelectImage(Theme.of(context)),
               /* RegisterTextField(
                    controller: emailController,
                    textOne: "Email Adress",
                    textTwo: "emiredro@yandex.com",
                    icon: AppImages.email),
                RegisterTextField(
                    controller: emailController,
                    textOne: "Username",
                    textTwo: "Your full name",
                    icon: "assets/svg/user.svg"),
                RegisterTextField(
                    controller: emailController,
                    textOne: "Password",
                    textTwo: "Minimum 8 characters",
                    icon: AppImages.clock),*/
                // Container(
                //   height: MediaQuery.of(context).size.height * 0.47,
                //   width: double.infinity,
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(12),
                //     color: AppColors.white,
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
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
        child: const Icon(Icons.search),
      ),
    );
  }
}
