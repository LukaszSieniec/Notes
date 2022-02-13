import 'package:flutter/material.dart';
import 'package:notes_app/constants/app_constants.dart';
import 'package:notes_app/models/note.dart';

class Notes extends StatelessWidget {
  final List<Note> notes;

  const Notes({required this.notes, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: notes.length,
        itemBuilder: (context, index) {
          return Card(
              elevation: 4,
              color: const Color(AppColors.brighterBackground),
              child: Center(child: Text(notes[index].content)));
        });
  }
}
