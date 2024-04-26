import 'dart:math';

import 'package:flutter/material.dart';

class AvatarWithName extends StatefulWidget {
  final String name;
  final double radius;
  final Color? backgroundColor;
  final Color? foregroundColor;

  const AvatarWithName(
      {super.key, required this.name, required this.radius, this.backgroundColor, this.foregroundColor});

  @override
  State<AvatarWithName> createState() => _AvatarWithNameState();
}

class _AvatarWithNameState extends State<AvatarWithName> {
  Color generateColorFromString(String name) {
    int hash = 0;
    for (int i = 0; i < name.length; i++) {
      hash = name.codeUnitAt(i) + ((hash << 5) - hash);
    }

    final random = Random(hash);
    return Color.fromRGBO(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      1.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    // Генерация случайного цвета для фона
    final Color bgColor = generateColorFromString(widget.name);

    // Разделение имени на имя и фамилию
    List<String> nameParts = widget.name.split(" ");
    String initials = nameParts.length > 1
        ? "${nameParts[0][0]}${nameParts[1][0]}" // первые буквы имени и фамилии
        : nameParts[0][0]; // только первая буква имени

    return CircleAvatar(
      backgroundColor: bgColor,
      radius: widget.radius,
      child: Text(
        initials.toUpperCase(),
        style: TextStyle(color: widget.foregroundColor ?? Colors.white),
      ),
    );
  }
}
