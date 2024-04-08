import 'package:flutter/material.dart';
import 'package:poll_dao/src/core/colors/app_colors.dart';
import 'package:poll_dao/src/features/discover_page/presentation/widgets/catetgory_base_container.dart';
import 'base_conatiner.dart';
import 'package:flutter/material.dart';
import 'package:poll_dao/src/core/colors/app_colors.dart';
import 'package:poll_dao/src/features/discover_page/presentation/widgets/catetgory_base_container.dart';
import 'base_conatiner.dart';

class SelectCategory extends StatefulWidget {
  const SelectCategory({
    Key? key,
    required this.selectColor,
    required this.onTap,
  }) : super(key: key);

  final bool selectColor;
  final VoidCallback onTap;

  @override
  State<SelectCategory> createState() => _SelectCategoryState();
}

class _SelectCategoryState extends State<SelectCategory> {
  bool selectColor = false;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(left: 16),
      scrollDirection: Axis.horizontal,
      itemCount: 4,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              selectColor = !selectColor; // Corrected this line
            });
            //widget.onTap(); // Invoke the onTap callback
          },
          child: SelectCategoryContainer(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            color: selectColor ? AppColors.c_93A2B4.withOpacity(0.3) : AppColors.c_5856D6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  categories[index],
                  style: TextStyle(
                    color: selectColor ? AppColors.c_5856D6 : AppColors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        width: 14,
      ),
    );
  }
}

List<String> categories = [
  "Sport",
  "Politic",
  "Culture",
  "Technologies",
];

// Wrap(
//   children:rhymes.map((e) => Padding(
//             padding: EdgeInsets.only(left: 4),
//             child: Text(e),
//           ))
//       .toList(),
// )