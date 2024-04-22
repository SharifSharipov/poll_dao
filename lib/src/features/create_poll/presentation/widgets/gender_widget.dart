import 'package:flutter/material.dart';
import 'package:poll_dao/src/core/colors/app_colors.dart';
import 'package:poll_dao/src/core/extentions/extentions.dart';
import 'package:poll_dao/src/features/create_poll/presentation/widgets/gender_select_widget.dart';

enum GenderType {
  all,
  men,
  women,
  other,
}

class SelectGenderWidget extends StatelessWidget {
  const SelectGenderWidget({super.key, required this.onChanged, required this.selectedGender});
  final ValueChanged<GenderType> onChanged;
  final GenderType selectedGender;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: AppColors.white),
      child: Column(
        children: [
          GenderOptionWidget(
            onTap: () => onChanged(GenderType.all),
            isSelected: selectedGender == GenderType.all,
            title: 'All',
          ),
          15.ph,
          GenderOptionWidget(
            onTap: () => onChanged(GenderType.men),
            isSelected: selectedGender == GenderType.men,
            title: 'Men',
          ),
          15.ph,
          GenderOptionWidget(
            onTap: () => onChanged(GenderType.women),
            isSelected: selectedGender == GenderType.women,
            title: 'Women',
          ),
          15.ph,
          GenderOptionWidget(
            onTap: () => onChanged(GenderType.other),
            isSelected: selectedGender == GenderType.other,
            title: 'Other',
          ),
        ],
      ),
    );
  }
}

class GenderOptionWidget extends StatelessWidget {
  const GenderOptionWidget({
    super.key,
    required this.title,
    required this.onTap,
    required this.isSelected,
  });

  final String title;
  final VoidCallback onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GenderSelect(onTap: onTap, isSelected: isSelected),
        20.pw,
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 17,
            color: AppColors.c_111111,
            letterSpacing: 0.3,
          ),
        )
      ],
    );
  }
}
