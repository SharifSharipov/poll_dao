import 'package:flutter/material.dart';
class PollResultPage extends StatefulWidget {
  const PollResultPage({super.key});

  @override
  State<PollResultPage> createState() => _PollResultPageState();
}

class _PollResultPageState extends State<PollResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Poll Result Page"),
        )
    );
  }
}
