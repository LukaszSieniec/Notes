import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/bloc/notes/notes_bloc.dart';
import 'package:notes_app/bloc/notes/notes_state.dart';
import 'package:notes_app/constants/app_constants.dart';
import 'package:notes_app/models/note.dart';
import 'package:notes_app/utils/size_config.dart';
import 'package:notes_app/views/screens/add_note_screen.dart';
import 'package:notes_app/views/widgets/home/notes.dart';
import 'package:notes_app/views/widgets/loading.dart';
import 'package:notes_app/views/widgets/message.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return BlocBuilder<NotesBloc, NotesState>(builder: (context, state) {
      if (state.notesStatus == NotesStatus.loading) {
        return _buildScaffold(buildLoading(), context, isVisible: false);
      } else if (state.notesStatus == NotesStatus.success) {
        return _buildScaffold(_buildHomeScreenBody(state.notes), context);
      } else {
        return _buildScaffold(Container(), context);
      }
    });
  }

  Widget _buildScaffold(Widget body, BuildContext context,
      {bool isVisible = true}) {
    return Scaffold(
        backgroundColor: const Color(AppColors.background),
        appBar: AppBar(
            title: Text(AppLabels.notes,
                style:
                    TextStyle(fontSize: SizeConfig.blockSizeVertical * 3.35)),
            centerTitle: true,
            flexibleSpace: Align(
                alignment: Alignment.bottomCenter,
                child: Divider(
                    height: SizeConfig.blockSizeVertical * 0.30,
                    color: Colors.white)),
            backgroundColor: Colors.transparent,
            elevation: 0),
        floatingActionButton: isVisible
            ? FloatingActionButton(
                backgroundColor: Colors.green,
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddNoteScreen())),
                child: const Icon(Icons.add))
            : Container(),
        body: body);
  }

  Widget _buildHomeScreenBody(List<Note> notes) {
    return Container(
        margin: EdgeInsets.only(
            left: SizeConfig.blockSizeHorizontal * 2.25,
            top: SizeConfig.blockSizeVertical * 1.15,
            right: SizeConfig.blockSizeHorizontal * 2.25,
            bottom: SizeConfig.blockSizeVertical * 1.15),
        child: notes.isNotEmpty
            ? Notes(notes: notes)
            : Message(messageSize: SizeConfig.blockSizeVertical * 3.35));
  }
}
