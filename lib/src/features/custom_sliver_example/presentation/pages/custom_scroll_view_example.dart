import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:poll_dao/src/core/extentions/extentions.dart';
import 'package:poll_dao/src/features/create_poll/presentation/widgets/add_options.dart';
import 'package:poll_dao/src/features/create_poll/presentation/widgets/advanced_audince_control.dart';
import 'package:poll_dao/src/features/custom_sliver_example/presentation/widgets/last_widget.dart';
import 'package:poll_dao/src/features/custom_sliver_example/presentation/widgets/type_select_options.dart';

import '../../../../core/icons/app_icons.dart';

class CustomScrollViewExample extends StatefulWidget {
  const CustomScrollViewExample({super.key});

  @override
  State<CustomScrollViewExample> createState() => _CustomScrollViewExampleState();
}

class _CustomScrollViewExampleState extends State<CustomScrollViewExample> {
  TextEditingController controllerOne = TextEditingController();
  TextEditingController controllerTwo = TextEditingController();
  List<TextEditingController> textControllers = [TextEditingController()];
  List<File?> imageFiles = [null];
  final pickImage = ImagePicker();
  bool showAddOptions = true; // Changed: Removed "!" after variable name
  int selecteddata = 1;

  @override
  void initState() {
    super.initState();
    textControllers = [TextEditingController()];
    imageFiles = [null];
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: lastedWidget(context: context, controllerOne: controllerOne),
          ),
          if (selecteddata == 1)
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 14),
                    child: Stack(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: textControllers[index],
                            decoration: const InputDecoration(
                              hintText: 'Option text',
                            ),
                            onChanged: (value) {
                              if (index == textControllers.length - 1 && value.isNotEmpty) {
                                setState(() {
                                  textControllers.add(TextEditingController());
                                });
                              }
                            },
                          ),
                        ),
                        Positioned(
                          right: 0,
                          child: Row(
                            children: [
                              if (textControllers[index].text.isNotEmpty)
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      textControllers[index].clear();
                                    });
                                  },
                                  icon: SvgPicture.asset(
                                    AppImages.cancel,
                                    width: 20,
                                  ),
                                )
                              else
                                const SizedBox(),
                              IconButton(
                                onPressed: () {},
                                icon: SvgPicture.asset(
                                  AppImages.graber,
                                  width: 30,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
                childCount: textControllers.length,
              ),
            ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                  30.ph,
                  AddOptions(
                    onTap: () {
                      showCupertinoDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return TypeOptions(
                            onTapOne: () {
                              setState(() {
                                selecteddata = 1;
                                Navigator.pop(context);
                              });
                            },
                            onTapTwo: () {
                              setState(() {
                                selecteddata = 2;
                                Navigator.pop(context);
                              });
                            },
                            onTapThree: () {
                              setState(() {
                                selecteddata = 3;
                                Navigator.pop(context);
                              });
                            },
                          );
                        },
                      );
                    },
                  ),
                  30.ph,
                  const AdvancedAudienceControl(),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
    );
  }
}

/*      SliverAppBar(
            backgroundColor: theme.primaryColor,
            pinned: false,
            floating: true,
            snap: true,
            title:const Text("Rhymer",style: TextStyle(color: Colors.white),),
            bottom: PreferredSize(child:TextFormField(),preferredSize: Size.fromHeight(70),),
          )*/
