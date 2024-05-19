import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:poll_dao/src/config/routes/routes.dart';
import 'package:poll_dao/src/core/extentions/extentions.dart';
import 'package:poll_dao/src/features/discover_page/domain/repositories/biometry_repository.dart';
import 'package:poll_dao/src/features/discover_page/presentation/widgets/time_ago_text.dart';
import 'package:poll_dao/src/features/local_auth/service/local_auth_service.dart';
import 'package:poll_dao/src/features/profile_page/presentation/manager/fetch_profile_data_bloc/fetch_profile_data_bloc.dart';
import 'package:poll_dao/src/features/sign_in_page/presentation/pages/sign_in_page.dart';
import 'package:poll_dao/src/features/sign_up_page/presentation/pages/sign_up_page.dart';
import 'package:poll_dao/src/features/widget_servers/loger_service/loger.dart';
import 'package:provider/provider.dart';

import '../../../../config/theme/fonts/app_text_style.dart';
import '../../../../core/colors/app_colors.dart';
import '../../../../core/constants/answer_constants.dart';
import '../../../../core/icons/app_icons.dart';
import '../../../onboarding_page/presentation/widgets/question_two/selected_unselected.dart';
import '../../../profile_page/presentation/pages/profile_page.dart';
import '../../../sign_in_page/presentation/widgets/global_button.dart';
import '../../../widget_servers/repositories/storage_repository.dart';
import '../../data/models/poll_model.dart';
import '../bloc/polls_bloc.dart';
import 'circle_avatar_with_name.dart';
import 'show_dialog.dart';

class PollWidget extends StatefulWidget {
  final Poll poll;
  final bool isBlured;

  const PollWidget({
    super.key,
    required this.poll,
    this.isBlured = false,
  });

  @override
  State<PollWidget> createState() => _PollWidgetState();
}

class _PollWidgetState extends State<PollWidget> {
  int? _selectedOptionId;
  PollResult? pollResult;
  List<String> _votePercentages = [];
  bool _userSelected = false;
  bool isChanges = false;

  @override
  void initState() {
    super.initState();
    if (widget.poll.userVote != null) {
      _selectedOptionId = widget.poll.userVote;
      _userSelected = true;
      getPollVoteResults(widget.poll.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (!widget.isBlured && _userSelected) {
          Navigator.pushNamed(
            context,
            RouteNames.pollResultPage,
            arguments: widget.poll.id,
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          padding: EdgeInsets.symmetric(horizontal: widget.isBlured ? 0 : 20, vertical: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: widget.isBlured ? 20 : 0.0),
                child: Row(
                  children: [
                    AvatarWithName(
                      name: widget.poll.author.name,
                      radius: 24,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AutoSizeText(widget.poll.author.name, style: AppTextStyle.bodyXlargeMedium, maxLines: 2),
                          TimeAgoText(createdAt: widget.poll.createdAt),
                        ],
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          if (widget.isBlured) return;
                          if (StorageRepository.getString("token") != "") {
                            pollShowDialog2(
                                context: context,
                                onTapOne: () {
                                  setState(() => isChanges = true);
                                  Navigator.pop(context);
                                },
                                onTapTwo: () {
                                  final userId = context.read<FetchProfileDataBloc>().state.profileModel.id;
                                  if (userId == widget.poll.author.id) {
                                    context.read<PollsBloc>().add(DeletePoll(widget.poll.id));
                                  } else {
                                    log("handle another person's post");
                                  }
                                  Navigator.pop(context);
                                },
                                onTapThree: () => Navigator.pop(context));
                          } else {
                            pollshowDialog(
                                context: context,
                                onTapOne: () {
                                  showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: AppColors.white,
                                      elevation: 0,
                                      context: context,
                                      builder: (context) => const SignUpPage());
                                },
                                onTapTwo: () {
                                  showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: AppColors.white,
                                      elevation: 0,
                                      context: context,
                                      builder: (context) => const SignInPage());
                                },
                                onTapThree: () => Navigator.pop(context));
                          }
                        },
                        icon: SvgPicture.asset(AppImages.artboard)),
                  ],
                ),
              ),
              20.ph,
              if (widget.isBlured)
                Stack(
                  children: [
                    Image.asset('assets/images/blured_poll.png'),
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: AppColors.c_5856D6, width: 1),
                        ),
                        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            children: [
                              Expanded(
                                child: Text(
                                  'some surveys are available only to people with a completed profile',
                                  textAlign: TextAlign.center,
                                  style: AppTextStyle.bodyXlargeMedium.copyWith(color: AppColors.c_5856D6),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GlobalButton(
                                    onTap: () {
                                      showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: AppColors.white,
                                        elevation: 0,
                                        context: context,
                                        builder: (context) {
                                          return const ProfilePage();
                                        },
                                      );
                                    },
                                    padding: const EdgeInsets.symmetric(vertical: 5),
                                    cornerRadius: 12,
                                    data: const Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                                          child: Text(
                                            'Complete profile',
                                            style: TextStyle(
                                              color: AppColors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 11,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    color: AppColors.c_5856D6,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              else ...[
                Text(widget.poll.name, style: AppTextStyle.bodyXlargeMedium),
                16.ph,
                SizedBox(
                    width: double.infinity,
                    child: widget.poll.options[0].image == null
                        ? // просто текст
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ...widget.poll.options.asMap().entries.map((entry) {
                                int index = entry.key;
                                Option option = entry.value;

                                return _buildOptionButton(
                                  option: option,
                                  index: index,
                                  pollId: widget.poll.id,
                                  isBiometryRequired: widget.poll.audience?.biometryPassed ?? false,
                                );
                              }),
                            ],
                          )
                        : widget.poll.options[0].image != null && widget.poll.options[0].text != null
                            ? // картинки + текст
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ...widget.poll.options.asMap().entries.map((entry) {
                                    int index = entry.key;
                                    Option option = entry.value;

                                    return _buildOptionButtonTextAndImage(
                                      option: option,
                                      index: index,
                                      pollId: widget.poll.id,
                                      isBiometryRequired: widget.poll.audience?.biometryPassed ?? false,
                                    );
                                  }),
                                ],
                              )
                            : // просто картинки
                            ClipRRect(
                                borderRadius: const BorderRadius.all(Radius.circular(12)),
                                child: _buildImageGrid(
                                  options: widget.poll.options,
                                  pollId: widget.poll.id,
                                  isBiometryRequired: widget.poll.audience?.biometryPassed ?? false,
                                ),
                              )),
                pollResult != null
                    ? Column(
                        children: [
                          12.ph,
                          Text(
                            "Total votes ${pollResult!.totalVotes}",
                            style: AppTextStyle.bodyMediumRegular.copyWith(color: AppColors.c_93A2B4),
                          )
                        ],
                      )
                    : Container()
              ],
            ],
          ),
        ),
      ),
    );
  }

  Future<void> voteInPoll(int pollId, int index) async {
    setState(() => _selectedOptionId = index);
    Dio dio = Dio();
    try {
      var response = await dio.post(
        'http://94.131.10.253:3000/vote/vote-in-poll',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'access-token': StorageRepository.getString("token"),
          },
        ),
        data: {'pollId': pollId, 'optionIndex': index},
      );
      if (response.statusCode == 200) {
        LoggerService.i('Vote successful');
        Navigator.pushNamed(context, RouteNames.pollResultPage, arguments: pollId);
        await getPollVoteResults(pollId);
        setState(() {
          _userSelected = true;
          _selectedOptionId = index;
        });

      } else {
        LoggerService.w('Failed to vote. Status code: ${response.statusCode}');
        LoggerService.w('Reason: ${response.statusMessage}');
      }
    } catch (e) {
      LoggerService.e('Error occurred voteInPoll: $e');
    }
  }

  Future<void> getPollVoteResults(int pollId) async {
    Dio dio = Dio();
    try {
      var response =
          await dio.get('http://94.131.10.253:3000/vote/poll-votes/$pollId',
              options: Options(
                headers: {
                  'access-token': StorageRepository.getString("token"),
                },
              ));
      if (response.statusCode == 200) {
        LoggerService.i('Get poll $pollId vote results');
        var responseData = response.data;
        if (responseData['voteResults'] == null) {
          await Future.delayed(const Duration(seconds: 3));
          getPollVoteResults(pollId);
          return;
        }
        pollResult = PollResult.fromJson(responseData);
        setState(() {
          _votePercentages = computeVotePercentages(pollResult!.voteResults);
        });
      } else {
        LoggerService.w('Failed to vote. Status code: ${response.statusCode}');
        LoggerService.w('Reason: ${response.statusMessage}');
      }
    } catch (e) {
      LoggerService.e('Error occurred getPollVoteResults: $e');
    }
  }

  List<String> computeVotePercentages(List<int>? votes) {
    if (votes == null || votes.isEmpty) {
      return [];
    }

    int totalVotes = votes.reduce((sum, element) => sum + element);
    if (totalVotes == 0) {
      return List.filled(votes.length, "0.00%");
    }

    return votes.map((votesForOption) {
      double percent = (votesForOption / totalVotes) * 100;
      return '${percent.toStringAsFixed(2)}%';
    }).toList();
  }

  Widget _buildImageGrid({
    required List<Option> options,
    required int pollId,
    required bool isBiometryRequired,
  }) {
    return StaggeredGrid.count(
      crossAxisCount: 2,
      mainAxisSpacing: 2,
      crossAxisSpacing: 2,
      children: List.generate(options.length, (index) {
        bool isSelected = index == _selectedOptionId;
        return StaggeredGridTile.count(
          crossAxisCellCount: index == 2 ? 2 : 1,
          mainAxisCellCount: 1,
          child: GestureDetector(
            onTap: () async {
              if (StorageRepository.getString("token").isEmpty) {
                Navigator.pushNamed(context, RouteNames.signInPage);
                return;
              }

              if (isBiometryRequired) {
                final isAllowedToVote =
                    await LocalAuthService.checkBiometryPassed(
                  isBiometryPassed: () async =>
                      context
                          .read<FetchProfileDataBloc>()
                          .state
                          .profileModel
                          .biometryPassed ==
                      true,
                  onBiometryPassed: () => BiometryRepository()
                      .sendBiometryPassed()
                      .then((value) => context
                          .read<FetchProfileDataBloc>()
                          .add(FetchProfileData())),
                );
                if (!isAllowedToVote) {
                  return;
                }
              }

              if (!isSelected && widget.poll.userVote == null || isChanges) {
                setState(() {
                  _selectedOptionId = options[index].id;
                  _votePercentages = computeVotePercentages(
                      widget.poll.pollResult!.voteResults);
                });
                await voteInPoll(pollId, index);
              }
            },
            child: Stack(fit: StackFit.expand, children: [
              Image.network(
                'http://94.131.10.253:3000/${options[index].image}',
                width: 100,
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 10,
                left: 8,
                child: SelectedUnselected(
                  isSelected: isSelected,
                  onTap: () async {
                    if (isBiometryRequired) {
                      final isAllowedToVote =
                          await LocalAuthService.checkBiometryPassed(
                        isBiometryPassed: () async =>
                            context
                                .read<FetchProfileDataBloc>()
                                .state
                                .profileModel
                                .biometryPassed ==
                            true,
                        onBiometryPassed: () => BiometryRepository()
                            .sendBiometryPassed()
                            .then((value) => context
                                .read<FetchProfileDataBloc>()
                                .add(FetchProfileData())),
                      );
                      if (!isAllowedToVote) {
                        return;
                      }
                    }
                    if (!isSelected && widget.poll.userVote == null ||
                        isChanges) {
                      setState(() {
                        _selectedOptionId = options[index].id;
                        _votePercentages = computeVotePercentages(
                            widget.poll.pollResult!.voteResults);
                        isSelected = !isSelected;
                      });
                      await voteInPoll(pollId, index);
                    }
                  },
                ),
              ),
              Positioned(
                bottom: 10,
                right: 8,
                child: Text(
                  _votePercentages.length > index
                      ? _votePercentages[index]
                      : '',
                  style: AppTextStyle.bodyMediumMedium
                      .copyWith(color: Colors.white),
                ),
              )
            ]),
          ),
        );
      }),
    );
  }

  Widget _buildOptionButton({
    required Option option,
    required int index,
    required int pollId,
    required bool isBiometryRequired,
  }) {
    bool isSelected = index == _selectedOptionId;
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 3),
        child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(
                    isSelected ? AppColors.c_5856D6 : AppColors.white),
                foregroundColor: WidgetStateProperty.all(
                    isSelected ? AppColors.secondary : AppColors.black),
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                )),
                minimumSize:
                    WidgetStateProperty.all(const Size(double.infinity, 45)),
                padding: WidgetStateProperty.all(const EdgeInsets.all(10.0)),
                shadowColor: WidgetStateProperty.all(Colors.transparent)),
            onPressed: () async {
              if (StorageRepository.getString('token').isEmpty) {
                Navigator.pushNamed(context, RouteNames.signInPage);
                return;
              }

              if (isBiometryRequired) {
                final isAllowedToVote =
                    await LocalAuthService.checkBiometryPassed(
                  isBiometryPassed: () async =>
                      context
                          .read<FetchProfileDataBloc>()
                          .state
                          .profileModel
                          .biometryPassed ==
                      true,
                  onBiometryPassed: () => BiometryRepository()
                      .sendBiometryPassed()
                      .then((value) => context
                          .read<FetchProfileDataBloc>()
                          .add(FetchProfileData())),
                );
                if (!isAllowedToVote) {
                  return;
                }
              }
              if (!isSelected && widget.poll.userVote == null || isChanges) {
                setState(() {
                  _selectedOptionId = option.id;
                  _votePercentages = computeVotePercentages(
                      widget.poll.pollResult!.voteResults);
                });
                await voteInPoll(pollId, index);
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.white,
                  radius: 18,
                  child: Text(
                    answerList[index].toUpperCase(),
                    style: const TextStyle(color: AppColors.c_5856D6),
                  ),
                ),
                8.pw,
                Expanded(
                  child: Text(
                    option.text ?? '',
                  ),
                ),
                Text(_votePercentages.length > index
                    ? _votePercentages[index]
                    : '')
              ],
            )));
  }

  Widget _buildOptionButtonTextAndImage({
    required Option option,
    required int index,
    required int pollId,
    required bool isBiometryRequired,
  }) {
    bool isSelected = index == _selectedOptionId;
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 3),
        child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(
                    isSelected ? AppColors.c_5856D6 : AppColors.white),
                foregroundColor: WidgetStateProperty.all(
                    isSelected ? AppColors.secondary : AppColors.black),
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                )),
                minimumSize:
                    WidgetStateProperty.all(const Size(double.infinity, 45)),
                padding: WidgetStateProperty.all(const EdgeInsets.all(10.0)),
                shadowColor: WidgetStateProperty.all(Colors.transparent)),
            onPressed: () async {
              if (isBiometryRequired) {
                final isAllowedToVote =
                    await LocalAuthService.checkBiometryPassed(
                  isBiometryPassed: () async =>
                      context
                          .read<FetchProfileDataBloc>()
                          .state
                          .profileModel
                          .biometryPassed ==
                      true,
                  onBiometryPassed: () => BiometryRepository()
                      .sendBiometryPassed()
                      .then((value) => context
                          .read<FetchProfileDataBloc>()
                          .add(FetchProfileData())),
                );
                if (!isAllowedToVote) {
                  return;
                }
              }
              if (!isSelected && widget.poll.userVote == null || isChanges) {
                setState(() {
                  _selectedOptionId = option.id;
                  _votePercentages = computeVotePercentages(
                      widget.poll.pollResult!.voteResults);
                });
                await voteInPoll(pollId, index);
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  child: Image.network(
                    'http://94.131.10.253:3000/${option.image}',
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                8.pw,
                Expanded(
                  child: Text(
                    option.text ?? '',
                  ),
                ),
                Text(
                  _votePercentages.length > index
                      ? _votePercentages[index]
                      : '',
                )
              ],
            )));
  }
}
