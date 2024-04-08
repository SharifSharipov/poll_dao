import 'package:flutter/material.dart';
import 'package:poll_dao/src/core/colors/app_colors.dart';

import 'base_conationer.dart';

ListView CaruselSelectImage(ThemeData theme) {
  return ListView.separated(
    padding: const EdgeInsets.only(left: 16),
    scrollDirection: Axis.horizontal,
    itemCount: 10,
    itemBuilder: (context, index) {
      final rhymes = List.generate(4, (index) => "Рифма $index");
      return BaseContainer(
        padding: const EdgeInsets.all(16),
        width: 200,
        margin: EdgeInsets.zero,
        radius: 20,
        color: AppColors.c_02182B,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Слово,",
              style: theme.textTheme.bodyLarge
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
            Flexible(
              child: Center(
                child: Text(
                  rhymes.asMap().entries.map((e) {
                    final sb = StringBuffer();
                    sb.write(e.value);
                    if (e.key != rhymes.length - 1) {
                      sb.write(",");
                    }
                    return sb.toString();
                  }).join(),
                  overflow: TextOverflow.visible,
                ),
              ),
            ),
            // Wrap(
            //   children:rhymes.map((e) => Padding(
            //             padding: EdgeInsets.only(left: 4),
            //             child: Text(e),
            //           ))
            //       .toList(),
            // )
          ],
        ),
      );
    },
    separatorBuilder: (context, index) => const SizedBox(
      width: 14,
    ),
  );
}
