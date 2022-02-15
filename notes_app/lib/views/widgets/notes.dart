import 'package:flutter/material.dart';
import 'package:notes_app/models/note.dart';
import 'package:notes_app/utils/size_config.dart';
import 'package:notes_app/views/widgets/note_item.dart';

class Notes extends StatelessWidget {
  final List<Note> notes;

  const Notes({required this.notes, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Container(
        margin: EdgeInsets.only(
            left: SizeConfig.blockSizeHorizontal * 2.25,
            top: SizeConfig.blockSizeVertical * 1.15,
            right: SizeConfig.blockSizeHorizontal * 2.25,
            bottom: SizeConfig.blockSizeVertical * 1.15),
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: notes.length,
            itemBuilder: (context, index) {
              return NoteItem(
                  note: notes[index],
                  horizontalPadding: SizeConfig.blockSizeHorizontal * 4.45,
                  verticalPadding: SizeConfig.blockSizeVertical * 1.15,
                  contentSize: SizeConfig.blockSizeVertical * 3.35,
                  creationDateSize: SizeConfig.blockSizeVertical * 2.25);
            }));
  }
}
