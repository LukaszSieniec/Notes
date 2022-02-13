import 'package:flutter/material.dart';
import 'package:notes_app/constants/app_constants.dart';
import 'package:notes_app/views/screens/add_note_screen.dart';
import 'package:notes_app/views/widgets/notes.dart';

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
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.green,
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AddNoteScreen())),
            child: const Icon(Icons.add)),
        body: Column(
            children: const [Divider(height: 2.0, color: Colors.white)]));
  }
}
