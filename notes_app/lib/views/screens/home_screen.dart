import 'package:flutter/material.dart';
import 'package:notes_app/constants/app_constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(AppColors.background),
        appBar: AppBar(
            title:
                const Text(AppLabels.notes, style: TextStyle(fontSize: 24.0)),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0),
        body: Column(
            children: const [Divider(height: 2.0, color: Colors.white)]));
  }
}
