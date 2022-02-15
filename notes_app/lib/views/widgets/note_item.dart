import 'package:flutter/material.dart';
import 'package:notes_app/constants/app_constants.dart';
import 'package:notes_app/models/note.dart';

class NoteItem extends StatelessWidget {
  final Note note;

  final double horizontalPadding;
  final double verticalPadding;

  final double contentSize;
  final double creationDateSize;

  const NoteItem(
      {required this.note,
      required this.horizontalPadding,
      required this.verticalPadding,
      required this.contentSize,
      required this.creationDateSize,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 4,
        color: const Color(AppColors.brighterBackground),
        child: Padding(
            padding: EdgeInsets.only(
                left: horizontalPadding,
                top: verticalPadding,
                right: horizontalPadding,
                bottom: verticalPadding),
            child: Stack(alignment: Alignment.center, children: [
              Text(note.myContent,
                  style: TextStyle(color: Colors.white, fontSize: contentSize))
            ])));
  }
}
