// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:poll_dao/src/core/icons/app_icons.dart';
import '../../../../config/routes/routes.dart';
import '../../../../core/colors/app_colors.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool showDetails = false;
  _init() async {
    await Future.delayed(const Duration(seconds: 1));
    // final String token = StorageRepository.getString("token");
    // Navigator.of(context).pushReplacementNamed(RouteNames.signInPage);
      Navigator.of(context).pushReplacementNamed(RouteNames.discoverPage);
  }

  @override
  void initState() {
    _init();
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        showDetails = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Image.asset(
          AppImages.logo,
          width: width / 3.53,
          height: height / 4.77,
        ),
      ),
    );
  }
}
