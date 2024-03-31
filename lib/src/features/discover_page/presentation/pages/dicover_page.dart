import 'package:flutter/material.dart';
class DisCoverPage extends StatefulWidget {
  const DisCoverPage({super.key});

  @override
  State<DisCoverPage> createState() => _DisCoverPageState();
}

class _DisCoverPageState extends State<DisCoverPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Discover"),
      ),
    );
  }
}
