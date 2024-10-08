import 'package:flutter/cupertino.dart';
import '../../../../core/colors/app_colors.dart';

Container answers(BuildContext context, String text)  {
  double width = MediaQuery.of(context).size.width;
  return Container(
    height: width >= 834 ? width / 19.2 : width / 14.2,
    width: width >= 834 ? width / 19.2 : width / 14.2,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(
        width >= 834 ? width / 38.4 : width / 28.4,
      ),
      color: AppColors.white,
    ),
    child: Center(
      child: Text(text,
          style:
              const TextStyle(color: AppColors.black, fontSize: 16, fontWeight: FontWeight.w500)),
    ),
  );
}
