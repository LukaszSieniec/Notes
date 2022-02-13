import 'package:flutter/material.dart';
import 'package:notes_app/constants/app_constants.dart';
import 'package:notes_app/models/note.dart';

class NoteItem extends StatelessWidget {
  final Note note;

  const NoteItem({required this.note, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 4,
        color: const Color(AppColors.brighterBackground),
        child: Padding(
            padding: const EdgeInsets.only(
                left: 16.0, top: 8.0, right: 16.0, bottom: 8.0),
            child: Center(
                child: Text(note.content,
                    style: const TextStyle(
                        color: Colors.white, fontSize: 16.0)))));
  }
}
