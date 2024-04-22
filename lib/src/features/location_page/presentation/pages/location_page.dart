import 'package:flutter/material.dart';
import 'package:poll_dao/src/core/colors/app_colors.dart';
import 'package:poll_dao/src/features/create_poll/presentation/widgets/selects_item_widget.dart';

import '../../../../core/constants/nationality_list.dart';
import '../../../create_poll/presentation/widgets/single_sellection_widget.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key, this.countries = ''});
  final String countries;

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  String _countries = '';

  @override
  void initState() {
    _countries = widget.countries;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleSelectionScaffold(
      title: 'Location',
      result: _countries,
      body: ListView.separated(
        itemCount: countries.length,
        separatorBuilder: (context, index) =>
            const Divider(color: AppColors.secondary, height: 1, indent: 20, endIndent: 20),
        itemBuilder: (context, index) => SelectsItemWidget(
          isChosen: _countries.contains(countries[index]),
          text: countries[index],
          onTap: () {
            if (_countries == countries[index]) {
              setState(() => _countries = '');
            } else {
              setState(() => _countries = countries[index]);
            }
          },
        ),
      ),
    );
  }
}
