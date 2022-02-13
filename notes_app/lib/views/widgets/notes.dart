import 'package:flutter/material.dart';
import 'package:notes_app/models/note.dart';
import 'package:notes_app/views/widgets/note_item.dart';

class Notes extends StatelessWidget {
  final List<Note> notes;

  const Notes({required this.notes, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: notes.length,
            itemBuilder: (context, index) {
              return NoteItem(note: notes[index]);
            }));
  }
}
