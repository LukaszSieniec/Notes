import 'package:flutter/material.dart';
import 'package:notes_app/constants/app_constants.dart';
import 'package:notes_app/models/note.dart';
import 'package:notes_app/utils/format.dart';

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
                left: horizontalPadding, right: horizontalPadding),
            child: Stack(alignment: Alignment.center, children: [
              Container(
                  padding: const EdgeInsets.only(top: 24.0, bottom: 24.0),
                  child: Text(note.myContent,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white, fontSize: contentSize))),
              Positioned(
                  right: 0,
                  bottom: 2.0,
                  child: Text(formatDate(note.creationDate),
                      style: TextStyle(
                          color: const Color(AppColors.colorText),
                          fontSize: creationDateSize,
                          fontWeight: FontWeight.bold)))
            ])));
  }
}
