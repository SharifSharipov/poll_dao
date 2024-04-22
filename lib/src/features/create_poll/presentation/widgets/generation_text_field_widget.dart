import 'package:flutter/material.dart';
class GenerationTextFiled extends StatefulWidget {
  const GenerationTextFiled({super.key, required this.controller, required this.onChanged, });
  final TextEditingController controller;
  final ValueChanged onChanged;

  @override
  State<GenerationTextFiled> createState() => _GenerationTextFiledState();
}

class _GenerationTextFiledState extends State<GenerationTextFiled> {
  @override
  Widget build(BuildContext context) {
    return Expanded(child: Row(children: [
      const Text("Hello Tashkent",style: TextStyle(color: Colors.red),),
          TextField(
            controller: widget.controller,
            onChanged: widget.onChanged,
          ),
    ],));
  }
}
