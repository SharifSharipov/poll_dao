import 'package:flutter/material.dart';
class ActivePolsPage extends StatefulWidget {
  const ActivePolsPage({super.key});

  @override
  State<ActivePolsPage> createState() => _ActivePolsPageState();
}

class _ActivePolsPageState extends State<ActivePolsPage> {
  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: Center(
        child: Text('ActivePolsPage'),
      ),
    );
  }
}
