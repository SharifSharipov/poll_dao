import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:poll_dao/src/config/theme/fonts/app_text_style.dart';
import 'package:poll_dao/src/core/colors/app_colors.dart';

class TimeAgoText extends StatelessWidget {
  final DateTime createdAt;

  const TimeAgoText({super.key, required this.createdAt});

  @override
  Widget build(BuildContext context) {
    Duration difference = DateTime.now().difference(createdAt);

    String timeAgoText = _formatDuration(difference);

    return AutoSizeText(
      timeAgoText,
      style: AppTextStyle.bodyLargeRegular.copyWith(color: AppColors.c_93A2B4),
    );
  }

  String _formatDuration(Duration duration) {
    if (duration.inSeconds < 60) {
      return '${duration.inSeconds} sec ago';
    } else if (duration.inMinutes < 60) {
      return '${duration.inMinutes} min ago';
    } else if (duration.inHours < 24) {
      return '${duration.inHours} hours ago';
    } else if (duration.inDays < 30) {
      return '${duration.inDays} days ago';
    } else if (duration.inDays < 365) {
      int months = duration.inDays ~/ 30;
      return '$months month${months > 1 ? 's' : ''} ago';
    } else {
      int years = duration.inDays ~/ 365;
      return '$years year${years > 1 ? 's' : ''} ago';
    }
  }
}
