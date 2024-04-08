import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:poll_dao/src/config/routes/routes.dart';
import 'package:poll_dao/src/core/colors/app_colors.dart';
import 'package:poll_dao/src/core/extentions/extentions.dart';
import 'package:poll_dao/src/core/icons/app_icons.dart';
import 'package:poll_dao/src/features/active_polls_page/presentation/widget/active_polls_page_widget_two.dart';
import 'package:poll_dao/src/features/active_polls_page/presentation/widget/activr_polls__page_widgets.dart';
import 'package:poll_dao/src/features/active_polls_page/presentation/widget/cupertinoactionsheet.dart';
import 'package:poll_dao/src/features/create_poll/presentation/widgets/advanced_audince_control.dart';

class ActivePolsPage extends StatefulWidget {
  const ActivePolsPage({Key? key}) : super(key: key);

  @override
  State<ActivePolsPage> createState() => _ActivePolsPageState();
}

class _ActivePolsPageState extends State<ActivePolsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      /* appBar:AppBar(
        leading: TextButton(onPressed: (){},child: Row(
          children: [
            SvgPicture.asset(AppImages.arrowBackIos),

            const Text('Back'),
          ],
        )),
        backgroundColor: AppColors.secondary,
        title: const Text('Insights'),
      ),*/
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, RouteNames.discoverPage);
                },
                child: Row(
                  children: [
                    SvgPicture.asset(AppImages.arrowBackIos),
                    20.pw,
                    const Text(
                      'Active Polls',
                      style: TextStyle(
                          color: AppColors.c_5856D6, fontSize: 17, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              const Text(
                'Insights',
                style: TextStyle(color: AppColors.black, fontSize: 17, fontWeight: FontWeight.w600),
              ),
              const Text("               "),
              IconButton(
                  onPressed: () {
                    showCupertinoDialog(
                        context: context,
                        builder: (BuildContext context) => CupertinoActionSheetActionWidget(
                              onPressed: () {},
                              text: 'Delete Poll',
                            ));
                  },
                  icon: SvgPicture.asset(AppImages.delete)),
            ],
          ),
          const ActivePollsPageWidgets(),
          const ActivePollsPageWidgetsTwo(),
          const AdvancedAudienceControl(),
        ],
      ),
    );
  }
}
