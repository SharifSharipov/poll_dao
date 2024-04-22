import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:poll_dao/src/core/colors/app_colors.dart';
import 'package:poll_dao/src/core/extentions/extentions.dart';
import 'package:poll_dao/src/features/active_polls_page/presentation/widget/cupertinoactionsheet.dart';
import 'package:poll_dao/src/features/widget_servers/repositories/storage_repository.dart';
import 'package:provider/provider.dart';

import '../../../../config/routes/routes.dart';
import '../../../../core/icons/app_icons.dart';
import '../../../create_poll/domain/repositories/repository.dart';
import '../../../create_poll/logic/create_poll_notifier.dart';
import '../../../create_poll/presentation/widgets/advanced_audince_control.dart';
import '../../../discover_page/data/models/poll_model.dart';
import '../../../discover_page/presentation/widgets/poll_widget.dart';

class ActivePolsPage extends StatefulWidget {
  const ActivePolsPage({super.key});

  @override
  State<ActivePolsPage> createState() => _ActivePolsPageState();
}

class _ActivePolsPageState extends State<ActivePolsPage> {
  late Future<List<Poll>> _pollsFuture;
  bool filterIsOpen = false;

  @override
  void initState() {
    super.initState();
    _pollsFuture = fetchPolls();
  }

  Future<List<Poll>> fetchPolls() async {
    final response = await http.get(Uri.parse('http://94.131.10.253:3000/poll/my'),
        headers: {"access-token": StorageRepository.getString("token")});

    if (response.statusCode == 200) {
      List<dynamic> pollJson = jsonDecode(response.body);
      return pollJson.map((json) => Poll.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load polls');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      body: Column(
        children: [
          20.ph,
          const _HeaderWidget(),
          20.ph,
          Expanded(
            child: ChangeNotifierProvider(
              create: (context) => CreatePollNotifier(const CreatePollRepository()),
              child: FutureBuilder<List<Poll>>(
                future: _pollsFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text("Error: ${snapshot.error}"));
                  } else if (snapshot.hasData && snapshot.data != null) {
                    return CustomScrollView(
                      slivers: [
                        SliverToBoxAdapter(
                          child: Consumer<CreatePollNotifier>(
                            builder: (context, filter, child) {
                              final polls = snapshot.data!.where((poll) {
                                if (!filter.isAccordionOpen) return true;

                                // gender
                                final bool isGenderValid = poll.audience!.gender == null ||
                                    poll.audience!.gender!.isEmpty ||
                                    poll.audience!.gender!.toLowerCase() == filter.selectedGender.name.toLowerCase();
                                // age
                                final pollMinAge =
                                    poll.audience!.age == null ? 0 : int.tryParse(poll.audience!.age!.split("-")[0]);
                                final pollMaxAge =
                                    poll.audience!.age == null ? 10 : int.tryParse(poll.audience!.age!.split("-")[1]);
                                final bool isAgeValid =
                                    (pollMinAge ?? 0) <= filter.minAge && (pollMaxAge ?? 100) <= filter.maxAge;
                                //location
                                final bool isLocationValid =
                                    filter.selectedLocation == '' || poll.audience!.location == filter.selectedLocation;
                                //education
                                final bool isEducationValid = filter.selectedEducationLevel == '' ||
                                    poll.audience!.education == filter.selectedEducationLevel;
                                //language
                                final bool isLanguageValid = filter.selectedLanguage.isEmpty ||
                                    filter.selectedLanguage.contains(poll.audience!.maternalLang);
                                //nationality
                                final bool isNationalityValid = filter.selectedNationality == '' ||
                                    poll.audience!.nationality == filter.selectedNationality;

                                return isGenderValid &&
                                    isAgeValid &&
                                    isLocationValid &&
                                    isEducationValid &&
                                    isLanguageValid &&
                                    isNationalityValid;
                              }).toList();
                              return ListView.builder(
                                itemCount: polls.length,
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return PollWidget(poll: polls[index]);
                                },
                              );
                            },
                          ),
                        ),
                        const SliverToBoxAdapter(
                          child: AdvancedAudienceControl(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            safeAreaTop: false,

                          ),
                        ),
                      ],
                    );
                  } else {
                    return const Center(child: Text("No data available"));
                  }
                },
              ),
            ),
          ),
          20.ph,
        ],
      ),
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
                style: TextStyle(color: AppColors.c_5856D6, fontSize: 17, fontWeight: FontWeight.w600),
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
    );
  }
}

/*ListView(
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
                      style: TextStyle(color: AppColors.c_5856D6, fontSize: 17, fontWeight: FontWeight.w600),
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
          ChangeNotifierProvider(
            create: (context) => CreatePollNotifier(const CreatePollRepository()),
            child: const AdvancedAudienceControl(),
          ),*/
