import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:poll_dao/src/core/colors/app_colors.dart';
import 'package:poll_dao/src/core/extentions/extentions.dart';
import 'package:poll_dao/src/core/icons/app_icons.dart';
import 'package:poll_dao/src/features/create_poll/presentation/widgets/answer_button.dart';

class InsertTextOption extends StatefulWidget {
  const InsertTextOption({
    super.key,
    required this.onChanged,
    required this.isValid,
    required this.label,
  });
  final ValueChanged<String> onChanged;
  final bool isValid;
  final String label;

  @override
  State<InsertTextOption> createState() => _InsertTextOptionState();
}

class _InsertTextOptionState extends State<InsertTextOption> {
  final controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _onTap() {
    setState(() {
      controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AnswerButtonFon(
              answer: widget.label,
              onTap: () {},
            ),
            10.pw,
            Expanded(
              child: TextField(
                onChanged: widget.onChanged,
                controller: controller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Insert text',
                  hintStyle: widget.isValid ? null : const TextStyle(color: Colors.red),
                  suffixIcon: controller.text.isNotEmpty
                      ? IconButton(
                          onPressed: _onTap,
                          icon: SvgPicture.asset(AppImages.cancel, width: 20),
                        )
                      : const SizedBox.shrink(),
                ),
              ),
            ),
            SizedBox(
              width: 40,
              child: SvgPicture.asset(AppImages.graber, width: 24),
            ),
          ],
        ),
        const Divider(height: 1, color: AppColors.secondary, thickness: 1, indent: 36),
      ],
    );
  }
}
