// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:poll_dao/src/core/colors/app_colors.dart';
import 'package:poll_dao/src/core/constants/answer_constants.dart';
import 'package:poll_dao/src/core/extentions/extentions.dart';
import 'package:poll_dao/src/core/icons/app_icons.dart';
import 'package:poll_dao/src/core/pop_ups.dart';
import 'package:poll_dao/src/features/create_poll/data/enum.dart';
import 'package:poll_dao/src/features/create_poll/data/models/option_model.dart';
import 'package:poll_dao/src/features/create_poll/logic/create_poll_notifier.dart';
import 'package:poll_dao/src/features/create_poll/presentation/dialogs.dart';
import 'package:poll_dao/src/features/create_poll/presentation/widgets/add_options.dart';
import 'package:poll_dao/src/features/create_poll/presentation/widgets/advanced_audince_control.dart';
import 'package:poll_dao/src/features/create_poll/presentation/widgets/custom_new_poll_navigate.dart';
import 'package:poll_dao/src/features/create_poll/presentation/widgets/insert_text_option.dart';
import 'package:poll_dao/src/features/create_poll/presentation/widgets/text_image_widget.dart';
import 'package:poll_dao/src/features/create_poll/presentation/widgets/text_widget.dart';
import 'package:poll_dao/src/features/create_poll/utils/utils.dart';
import 'package:poll_dao/src/features/custom_sliver_example/presentation/widgets/poll_title_widget.dart';
import 'package:poll_dao/src/features/topics/presentation/select_topic_widget.dart';
import 'package:poll_dao/src/features/widgets/base_bottom_sheet_for_create_poll.dart';
import 'package:provider/provider.dart';

class CreatePoll extends StatelessWidget {
  const CreatePoll({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<CreatePollNotifier>();
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: BaseBottomSheetForCreatePoll(
        height: height,
        backgroundColor: AppColors.c_F8F8FF,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: AppColors.c_F8F8FF,
              surfaceTintColor: AppColors.c_F8F8FF,
              pinned: true,
              automaticallyImplyLeading: false,
              title: Column(
                children: [
                  15.ph,
                  CustomNewPollNavigate(
                    isLoading: notifier.isLoading,
                    onDone: () {
                      notifier.sendPollRequest().then((value) {
                        if (value) {
                          Navigator.pop(context);
                        }
                      });
                    },
                    onCancel: () =>
                        showAppActionSheet(context: context, child: const DiscardActionSheet()).then((value) {
                      if (value == true) {
                        Navigator.pop(context);
                      }
                    }),
                  ),
                ],
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  20.ph,
                  PollTitleWidget(
                    isValidated: !notifier.validationRequired || notifier.isQuestionValidated,
                    onChanged: (value) => notifier.setQuestion(value),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: customTextWidget(text: "Options", color: AppColors.black),
                  ),
                  10.ph,
                  if (notifier.answerType == OptionsType.image)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: GridView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 1.3,
                        ),
                        itemCount: notifier.options.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Stack(
                            children: [
                              if (notifier.options[index].image != null)
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.file(
                                    File(notifier.options[index].image!),
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    height: double.infinity,
                                  ),
                                ),
                              Positioned(
                                top: 5,
                                right: 5,
                                child: IconButton(
                                  icon: SvgPicture.asset(AppImages.cancel, height: 24, width: 24),
                                  onPressed: () {
                                    notifier.deleteImage(index);
                                  },
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    )
                  else
                    Container(
                      margin: notifier.options.isEmpty ? null : const EdgeInsets.symmetric(horizontal: 20),
                      padding: (notifier.options.isEmpty || notifier.answerType == OptionsType.textImage)
                          ? null
                          : const EdgeInsets.symmetric(vertical: 9, horizontal: 15),
                      decoration: BoxDecoration(
                        color: notifier.answerType == OptionsType.text ? AppColors.white : Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ReorderableListView.builder(
                        proxyDecorator: (child, index, animation) {
                          return Material(
                            color: Colors.transparent,
                            child: SizeTransition(
                              sizeFactor: animation.drive(CurveTween(curve: Curves.easeInOut)),
                              child: child,
                            ),
                          );
                        },
                        dragStartBehavior: DragStartBehavior.down,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: notifier.options.length,
                        onReorderStart: (_) => FocusManager.instance.primaryFocus?.unfocus(),
                        onReorder: (oldIndex, newIndex) {
                          notifier.reorderOptions(oldIndex, newIndex);
                        },
                        itemBuilder: (context, index) {
                          final option = notifier.options[index];
                          return _Item(
                            key: ValueKey(option.createdAt),
                            label: answerList[index],
                            option: option,
                            answerType: notifier.answerType!,
                            validationRequired: notifier.validationRequired,
                            onTextChanged: (value) {
                              notifier.editOption(index, option.copyWith(text: value));
                            },
                            onImageChanged: (value) {
                              notifier.editOption(index, option.copyWith(image: value));
                            },
                          );
                        },
                      ),
                    ),
                  if (notifier.validationRequired && !notifier.isOptionsValidated)
                    const Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: ValidationErrorText(text: 'Minimum 2 options'),
                    ),
                  10.ph,
                  AddOptions(
                    onTap: () async {
                      switch (notifier.answerType) {
                        case OptionsType.text:
                          if (notifier.options.length < 6) {
                            notifier.addOption(OptionModel(createdAt: DateTime.now()));
                          }
                          break;
                        case OptionsType.image:
                          if (notifier.options.length < 6) {
                            selectMultipleImages().then((value) {
                              if (value != null) {
                                for (var element in value) {
                                  if (notifier.options.length < 6) {
                                    notifier.addOption(OptionModel(image: element, createdAt: DateTime.now()));
                                  }
                                }
                              }
                            });
                          }
                          break;
                        case OptionsType.textImage:
                          if (notifier.options.length < 6) {
                            selectMultipleImages().then((value) {
                              if (value != null) {
                                for (var element in value) {
                                  if (notifier.options.length < 6) {
                                    notifier.addOption(OptionModel(image: element, createdAt: DateTime.now()));
                                  }
                                }
                              }
                            });
                          }

                          break;
                        default:
                          showDropDown(context).then(
                            (value) {
                              if (value == OptionsType.image || value == OptionsType.textImage) {
                                selectMultipleImages().then(
                                  (images) {
                                    if (images != null) {
                                      notifier.setAnswerType(value);
                                      for (var element in images) {
                                        notifier.addOption(OptionModel(image: element, createdAt: DateTime.now()));
                                      }
                                    }
                                  },
                                );
                                return;
                              }
                              if (value == OptionsType.text) {
                                notifier.setAnswerType(value);
                                notifier.addOption(OptionModel(createdAt: DateTime.now()));
                                notifier.addOption(OptionModel(createdAt: DateTime.now()));
                              }
                            },
                          );
                      }
                    },
                  ),
                  30.ph,
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: customTextWidget(text: "Topic", color: AppColors.black),
                    ),
                  ),
                  10.ph,
                  SelectTopicWidget(
                      isValidated: !notifier.validationRequired // если валидация не требуется, то всегда true
                          ||
                          notifier.isTopicSelected,
                      selectedIndex: notifier.selectedTopicIndex,
                      onSelected: (index) => notifier.setSelectedTopic(index)),
                  const AdvancedAudienceControl()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({
    super.key,
    required this.label,
    required this.option,
    required this.answerType,
    required this.validationRequired,
    required this.onTextChanged,
    required this.onImageChanged,
  });
  final String label;
  final OptionModel option;
  final OptionsType answerType;
  final bool validationRequired;
  final ValueChanged<String> onTextChanged;
  final ValueChanged<String?> onImageChanged;

  @override
  Widget build(BuildContext context) {
    switch (answerType) {
      case OptionsType.text:
        return InsertTextOption(
          label: label,
          isValid: !validationRequired // если валидация не требуется, то всегда true
              ||
              (option.text != null && option.text!.isNotEmpty),
          onChanged: onTextChanged,
        );

      case OptionsType.textImage:
        return TextImageWidget(
          isValid: !validationRequired // если валидация не требуется, то всегда true
              ||
              (option.text != null && option.text!.isNotEmpty && option.image != null && option.image!.isNotEmpty),
          text: option.text ?? "",
          image: option.image,
          onImageChanged: onImageChanged,
          onTextChanged: onTextChanged,
        );
      default:
        return const SizedBox.shrink();
    }
  }
}
