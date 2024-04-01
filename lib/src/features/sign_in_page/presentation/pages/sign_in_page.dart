import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:poll_dao/src/core/icons/app_icons.dart';
class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

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
      body: Column(
        children: [
          Image.asset("assets/images/img.png"),
          SvgPicture.asset(AppImages.personFive,height: 100,width: 100,),
          SvgPicture.asset("assets/svg/person_five.svg",height: 100,width: 100,),
          Image.asset("assets/images/variations_two.png"),
        ],
      ),
    );
  }
}
