import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:poll_dao/src/config/routes/routes.dart';
import 'package:poll_dao/src/core/colors/app_colors.dart';
import 'package:poll_dao/src/core/icons/app_icons.dart';
import 'package:poll_dao/src/features/nationality_page/presentation/widgets/nationality_widget.dart';
import '../../../../core/constants/nationality_list.dart';
import '../../../profile_page/presentation/manager/fetch_profile_data_bloc/fetch_profile_data_bloc.dart';
class NationalityPage extends StatefulWidget {
  const NationalityPage({super.key});

  @override
  State<NationalityPage> createState() => _NationalityPageState();
}

class _NationalityPageState extends State<NationalityPage> {
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
          "Nationality",
          style: TextStyle(color: AppColors.black, fontSize: 17, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body:  ListView.separated(
        itemCount: countries.length,
        separatorBuilder: (context, index) => Divider(
          color: AppColors.black.withOpacity(0.3),
          height: 1,
        ),
        itemBuilder: (context, index) => NationalityWidget(
          text: countries[index],
          onTap: () {
            context.read<FetchProfileDataBloc>().add(UpdateNationality(nationality: countries[index]));
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
