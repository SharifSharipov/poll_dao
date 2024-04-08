import 'package:flutter/material.dart';
import 'base_conatiner.dart';
GestureDetector SelectCategory(ThemeData theme, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: ListView.separated(
      padding: const EdgeInsets.only(left: 16),
      scrollDirection: Axis.horizontal,
      itemCount: 4,
      itemBuilder: (context, index) {
        return BaseContainer(
          padding: const EdgeInsets.symmetric(horizontal: 25),
         // margin: EdgeInsets.zero,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                categories[index],
                style: theme.textTheme.bodyLarge
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        width: 14,
      ),
    ),
  );
}
List<String>categories = [
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