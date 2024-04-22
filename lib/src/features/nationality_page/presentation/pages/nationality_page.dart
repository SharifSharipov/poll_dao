import 'package:flutter/material.dart';
import 'package:poll_dao/src/core/colors/app_colors.dart';
import 'package:poll_dao/src/features/create_poll/presentation/widgets/selects_item_widget.dart';

import '../../../../core/constants/nationality_list.dart';
import '../../../create_poll/presentation/widgets/single_sellection_widget.dart';

class NationalityPage extends StatefulWidget {
  const NationalityPage({super.key, this.nationalities = ''});
  final String nationalities;

  @override
  State<NationalityPage> createState() => _NationalityPageState();
}

class _NationalityPageState extends State<NationalityPage> {
  String _nationalities = '';

  @override
  void initState() {
    super.initState();
    _nationalities = widget.nationalities;
  }

  @override
  Widget build(BuildContext context) {
    return SingleSelectionScaffold(
      title: 'Nationality',
      result: _nationalities,
      body: ListView.separated(
        itemCount: countries.length,
        separatorBuilder: (context, index) =>
            const Divider(color: AppColors.secondary, height: 1, indent: 20, endIndent: 20),
        itemBuilder: (context, index) => SelectsItemWidget(
          isChosen: _nationalities.contains(countries[index]),
          text: countries[index],
          onTap: () {
            if (_nationalities == countries[index]) {
              setState(() => _nationalities = '');
            } else {
              setState(() => _nationalities = countries[index]);
            }
          },
        ),
      ),
    );
  }
}
