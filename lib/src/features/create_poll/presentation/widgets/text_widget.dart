import 'package:flutter/cupertino.dart';
Widget customTextWidget({required String text, required Color color}) {
  return Text(
    text,
    style: TextStyle(color: color, fontSize: 17, fontWeight: FontWeight.w600, letterSpacing: 0.3),
  );
}
