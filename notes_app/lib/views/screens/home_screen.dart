import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/bloc/notes/notes_bloc.dart';
import 'package:notes_app/bloc/notes/notes_state.dart';
import 'package:notes_app/constants/app_constants.dart';
import 'package:notes_app/utils/size_config.dart';
import 'package:notes_app/views/screens/add_note_screen.dart';
import 'package:notes_app/views/widgets/notes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return BlocBuilder<NotesBloc, NotesState>(builder: (context, state) {
      return Scaffold(
          backgroundColor: const Color(AppColors.background),
          appBar: AppBar(
              title: Text(AppLabels.notes,
                  style:
                      TextStyle(fontSize: SizeConfig.blockSizeVertical * 3.35)),
              centerTitle: true,
              backgroundColor: Colors.transparent,
              elevation: 0),
          floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.green,
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AddNoteScreen())),
              child: const Icon(Icons.add)),
          body: Column(children: [
            Divider(
                height: SizeConfig.blockSizeVertical * 0.30,
                color: Colors.white),
            Notes(notes: state.notes)
          ]));
    });
  }
}
