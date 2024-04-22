import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:poll_dao/src/config/routes/routes.dart';
import 'package:poll_dao/src/core/colors/app_colors.dart';
import 'package:poll_dao/src/core/icons/app_icons.dart';
import 'package:poll_dao/src/features/location_page/presentation/widgets/location_widget.dart';

import '../../../../core/constants/nationality_list.dart';
class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(onPressed: () {
          Navigator.pushNamed(context, RouteNames.discoverPage);
        }, icon:SvgPicture.asset(AppImages.arrowBackIos),),
        title: const Text(
          "Location",
          style: TextStyle(color: AppColors.black, fontSize: 17, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: ListView.separated(
        itemCount: countries.length,
        separatorBuilder: (context, index) => Divider(
          color: AppColors.black.withOpacity(0.3),
          height: 1,
        ),
        itemBuilder: (context, index) => LocationWidget(
          text: countries[index],
          onTap: () {},
        ),
      ),
    );
  }
}
