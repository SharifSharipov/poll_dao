import 'package:flutter/cupertino.dart';
import 'package:poll_dao/src/core/colors/app_colors.dart';
import '../../../widgets/base_conationer.dart';
class CheckBiometric extends StatelessWidget {
  final bool value;
  final String text;
  final double size;
  final ValueChanged<bool>? onChaged;
  const CheckBiometric(
      {super.key, required this.value, required this.text, required this.size, this.onChaged});
  @override
  Widget build(BuildContext context) {
    return  BaseContainer(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      radius: 10,
      color: AppColors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style:TextStyle(color: AppColors.black, fontSize: size, fontWeight: FontWeight.w600, letterSpacing: 0.3),
          ),
          CupertinoSwitch(value: value, onChanged:onChaged)
        ],
      ),
    );
  }
}