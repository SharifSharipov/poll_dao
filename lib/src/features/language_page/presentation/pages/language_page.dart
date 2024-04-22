import 'package:flutter/material.dart';
import 'package:poll_dao/src/core/colors/app_colors.dart';
import 'package:poll_dao/src/core/constants/language_list.dart';
import 'package:poll_dao/src/features/create_poll/presentation/widgets/base_selection_scaffold.dart';
import 'package:poll_dao/src/features/create_poll/presentation/widgets/selects_item_widget.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key, this.languages = const []});
  final List<String> languages;

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  final List<String> _languages = [];

  @override
  void initState() {
    super.initState();
    _languages.addAll(widget.languages);
  }

  @override
  Widget build(BuildContext context) {
    return BaseSelectionScaffold(
      title: 'Language',
      result: _languages,
      body: ListView.separated(
        itemCount: languages.length,
        separatorBuilder: (context, index) =>
            const Divider(color: AppColors.secondary, height: 1, indent: 20, endIndent: 20),
        itemBuilder: (context, index) => SelectsItemWidget(
          isChosen: _languages.contains(languages[index]),
          text: languages[index],
          onTap: () {
            setState(
            () => _languages.contains(languages[index])
                ? _languages.remove(languages[index])
                : _languages.add(languages[index]),
          );
          },
        ),
      ),
    );
  }
}
