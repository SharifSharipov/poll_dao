import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:poll_dao/src/config/routes/routes.dart';
import 'package:poll_dao/src/core/colors/app_colors.dart';
import 'package:poll_dao/src/core/icons/app_icons.dart';
import 'package:poll_dao/src/features/create_poll/domain/repositories/repository.dart';
import 'package:poll_dao/src/features/create_poll/logic/create_poll_notifier.dart';
import 'package:poll_dao/src/features/create_poll/presentation/pages/create_poll.dart';
import 'package:poll_dao/src/features/discover_page/data/models/poll_model.dart';
import 'package:poll_dao/src/features/discover_page/presentation/bloc/polls_bloc.dart';
import 'package:poll_dao/src/features/discover_page/presentation/widgets/category_select.dart';
import 'package:poll_dao/src/features/profile_page/data/models/profile_model.dart';
import 'package:poll_dao/src/features/profile_page/presentation/pages/profile_page.dart';
import 'package:poll_dao/src/features/widget_servers/loger_service/loger.dart';
import 'package:poll_dao/src/features/widget_servers/repositories/storage_repository.dart';
import 'package:provider/provider.dart';

import '../../../profile_page/presentation/manager/fetch_profile_data_bloc/fetch_profile_data_bloc.dart';
import '../../../widget_servers/status/status.dart';
import '../widgets/active_polls_navigate.dart';
import '../widgets/poll_widget.dart';

class DisCoverPage extends StatefulWidget {
  const DisCoverPage({super.key});

  @override
  State<DisCoverPage> createState() => _DisCoverPageState();
}

class _DisCoverPageState extends State<DisCoverPage> {
  bool isVoice = true;
  late final FetchProfileDataBloc fetchProfileDataBloc;
  late final PollsBloc pollsBloc;
  @override
  void initState() {
    super.initState();
    fetchProfileDataBloc = BlocProvider.of<FetchProfileDataBloc>(context);
    pollsBloc = BlocProvider.of<PollsBloc>(context);
    if (fetchProfileDataBloc.state.status == FormStatus.pure && StorageRepository.getString("token").isNotEmpty) {
      fetchProfileDataBloc.add(FetchProfileData());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF0F3FA),
      appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xffF0F3FA),
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: AppColors.c_C8E8FA),
                child: IconButton(onPressed: () {
                  if (StorageRepository.getString("token").isNotEmpty) {
                    showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: AppColors.white,
                        elevation: 0,
                        context: context,
                        builder: (context) {
                          return const ProfilePage();
                        });
                  } else {
                    Navigator.pushNamed(context, RouteNames.signInPage);
                  }
                }, icon: BlocBuilder<FetchProfileDataBloc, FetchProfileDataState>(
                  builder: (context, state) {
                    if (state.status == FormStatus.success && state.profileModel.name != null) {
                      return Text(state.profileModel.name![0].toUpperCase());
                    } else {
                      return SvgPicture.asset(AppImages.user);
                    }
                  },
                ))),
          ),
          actions: [
            IconButton(
              onPressed: () async {
                await showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: AppColors.white,
                  elevation: 0,
                  context: context,
                  builder: (context) => ChangeNotifierProvider(
                    create: (context) => CreatePollNotifier(const CreatePollRepository()),
                    child: const CreatePoll(),
                  ),
                );
                pollsBloc.add(GetPolls());
              },
              icon: SvgPicture.asset(AppImages.add),
            )
          ]),
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0).copyWith(bottom: 10),
              child: const Text(
                "Discover",
                style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold, color: AppColors.black),
              ),
            ),
          ),
          SliverToBoxAdapter(
              child: StorageRepository.getString("token") != ""
                  ? Column(children: [
                      FutureBuilder<int>(
                        future: fetchMyPolls(),
                        builder: (context, snapshot) {
                          final bool isLoading = snapshot.connectionState == ConnectionState.waiting;
                          final error = snapshot.error;
                          if (snapshot.hasError) {
                            return Text("Error: ${snapshot.error}");
                          } else {
                            return ActivePollsNavigate(
                              radius: 20,
                              color: AppColors.c_5856D6,
                              textColorOne: AppColors.white,
                              textColorTwo: AppColors.white.withOpacity(0.7),
                              onTap: () => Navigator.pushNamed(context, RouteNames.activePollsPage),
                              icon: AppImages.arrowBackAndroidRight,
                              textOne: "${error ?? (isLoading ? '...' : snapshot.data)} Active Polls",
                              textTwo: 'See Details',
                              textSizeOne: 20,
                              textSizeTwo: 15,
                              fontWeightTextOne: FontWeight.w600,
                              fontWeightTextTwo: FontWeight.w500,
                            );
                          }
                        },
                      ),
                    ])
                  : Container()),
          const SliverToBoxAdapter(child: Gap(10)), // :))
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SelectCategory(selectColor: isVoice),
            ),
          ),
          const SliverGap(10), // :))
          const PollListWidget(),
        ],
      ),
    );
  }
}

class PollListWidget extends StatefulWidget {
  final int? currentCategoryId;
  final ProfileModel? profileModel;

  const PollListWidget({super.key, this.currentCategoryId, this.profileModel});

  @override
  State<PollListWidget> createState() => _PollListWidgetState();
}

class _PollListWidgetState extends State<PollListWidget> {
  late CategoryProvider categoryProvider;
  late final PollsBloc pollsBloc;
  late final FetchProfileDataBloc userBloc;

  @override
  void initState() {
    super.initState();
    pollsBloc = BlocProvider.of<PollsBloc>(context);
    userBloc = BlocProvider.of<FetchProfileDataBloc>(context);
    categoryProvider = Provider.of<CategoryProvider>(context, listen: false);
    categoryProvider.addListener(_fetchPolls);
    _fetchPolls();
  }

  @override
  void dispose() {
    categoryProvider.removeListener(_fetchPolls);
    super.dispose();
  }

  void _fetchPolls() async {
    final categoryId = categoryProvider.selectedCategoryId;
    if (categoryId == null) {
      pollsBloc.add(GetPolls());
    } else {
      pollsBloc.add(GetPollsByCategory(categoryId));
    }
  }

  List<Poll> filterAudiences(List<Poll> pollList, ProfileModel profile) {
    Poll? currentPoll;
    List<String> male = ['male', 'man'];
    List<String> female = ['female', 'girl'];
    try {
      return pollList.where((poll) {
        currentPoll = poll;
        if (poll.audience!.maternalLang != null &&
            poll.audience!.maternalLang!.isNotEmpty &&
            poll.audience!.maternalLang != profile.maternalLang.toString()) {
          return false;
        }
        if (poll.audience!.age != null &&
            poll.audience!.age!.isNotEmpty &&
            !poll.audience!.age!.contains("undefined")) {
          if (poll.audience!.age!.contains('-')) {
            List<String> ageRange = poll.audience!.age!.split('-');
            if (ageRange.length == 2) {
              int lower = int.parse(ageRange[0]);
              int upper = int.parse(ageRange[1]);
              if (profile.age < lower || profile.age > upper) {
                return false;
              }
            }
          } else {
            int age = int.parse(poll.audience!.age!);
            if (profile.age != age) {
              return false;
            }
          }
        }
        if (poll.audience!.gender != null &&
            poll.audience!.gender!.isNotEmpty &&
            !poll.audience!.gender!.toLowerCase().contains('all')) {
          if (male.contains(profile.gender.toLowerCase()) && !male.contains(poll.audience!.gender!.toLowerCase())) {
            return false;
          }
          if (female.contains(profile.gender.toLowerCase()) && !female.contains(poll.audience!.gender!.toLowerCase())) {
            return false;
          }
        }
        if (poll.audience!.location != null &&
            poll.audience!.location!.isNotEmpty &&
            poll.audience!.location != profile.location) {
          return false;
        }
        if (poll.audience!.education != null &&
            poll.audience!.education!.isNotEmpty &&
            poll.audience!.education != profile.education) {
          return false;
        }
        if (poll.audience!.nationality != null &&
            poll.audience!.nationality!.isNotEmpty &&
            poll.audience!.nationality != profile.nationality) {
          return false;
        }

        return true;
      }).toList();
    } catch (e) {
      LoggerService.e("error sorting polls $e, age: $currentPoll ");
      return pollList;
    }
  }

  bool shouldBlur(ProfileModel user, Audience audience) {
    final bool isAgeValid = audience.age == null || audience.age!.isEmpty || (user.age != 0);
    final bool isGenderValid = audience.gender == null || audience.gender!.isEmpty || (user.gender.isEmpty);
    final bool isEducationValid = audience.education == null || audience.education!.isEmpty || (user.education.isEmpty);
    final bool isLocationValid = audience.location == null || audience.location!.isEmpty || (user.location.isEmpty);
    final bool isNationalityValid = audience.nationality == null ||
        audience.nationality!.isEmpty ||
        (user.nationality.isEmpty && audience.nationality != null);

    return !isAgeValid || !isGenderValid || !isEducationValid || !isLocationValid || !isNationalityValid;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PollsBloc, PollsState>(
      builder: (context, state) {
        if (state is PollsBlocLoading) {
          return const SliverToBoxAdapter(child: Center(child: CircularProgressIndicator()));
        } else if (state is PollsBlocLoaded) {
          final List<Poll> polls = filterAudiences(state.polls, userBloc.state.profileModel);
          return SliverList.builder(
            itemCount: polls.length,
            itemBuilder: (context, index) {
              final user = userBloc.state.profileModel;
              final isBlurWidget = polls[index].audience == null ? false : shouldBlur(user, polls[index].audience!);
              return RepaintBoundary(
                child: PollWidget(
                  poll: polls[index],
                  isBlured: isBlurWidget,
                ),
              );
            },
          );
        } else if (state is PollsError) {
          return SliverToBoxAdapter(child: Center(child: Text(state.message)));
        } else {
          return const SliverToBoxAdapter(child: SizedBox());
        }
      },
    );
  }
}

Future<List<Poll>> fetchPolls({int? selectedCategoryId}) async {
  final Dio dio = Dio();

  try {
    String? token = StorageRepository.getString("token");
    String url = 'http://94.131.10.253:3000/public/polls';

    if (selectedCategoryId != null) {
      url += '?topic=$selectedCategoryId';
    }

    final options = Options(headers: {"access-token": token});
    final responce = await dio.get(url, options: options);

    if (responce.statusCode == 200) {
      final List<dynamic> jsonData = responce.data;

      final polls = jsonData.map((json) => Poll.fromJson(json)).toList().reversed;
      return polls.toList();
    } else {
      return [];
    }
  } catch (e) {
    LoggerService.e('fetch polls $e');
    return [];
  }
}

Future<int> fetchMyPolls() async {
  final Dio dio = Dio();

  try {
    String? token = StorageRepository.getString("token");

    final options = Options(headers: {"access-token": token});

    final response = await dio.get(
      'http://94.131.10.253:3000/poll/my',
      options: options,
    );

    if (response.statusCode == 200) {
      List<dynamic> data = response.data;
      return data.length;
    } else {
      throw Exception("Failed to fetch data: ${response.statusCode}");
    }
  } catch (e) {
    LoggerService.e('$e');
    return 0;
  }
}
