import 'package:flutter/material.dart';
import 'package:notes_app/bloc/add_note/add_note_bloc.dart';
import 'package:notes_app/bloc/add_note/add_note_event.dart';
import 'package:notes_app/bloc/add_note/add_note_state.dart';
import 'package:notes_app/constants/app_constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({Key? key}) : super(key: key);

  @override
  _AddNoteScreenState createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  final TextEditingController _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddNoteBloc, AddNoteState>(listener: (context, state) {
      if (state.addNoteStatus == AddNoteStatus.emptyContent) {
      } else if (state.addNoteStatus == AddNoteStatus.success) {
        Navigator.pop(context);
      } else if (state.addNoteStatus == AddNoteStatus.failure) {}
    }, builder: (context, state) {
      return Scaffold(
          backgroundColor: const Color(AppColors.background),
          appBar: AppBar(
              title: const Text(AppLabels.addNote,
                  style: TextStyle(fontSize: 24.0)),
              centerTitle: true,
              backgroundColor: Colors.transparent,
              elevation: 0,
              automaticallyImplyLeading: false,
              actions: [
                IconButton(
                    onPressed: () => context
                        .read<AddNoteBloc>()
                        .add(SavedNote(_contentController.text)),
                    icon: const Icon(Icons.save, size: 24.0))
              ]),
          body: Column(children: [
            const Divider(height: 2.0, color: Colors.white),
            Container(
                margin:
                    const EdgeInsets.only(left: 32.0, top: 32.0, right: 32.0),
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    color: Colors.white),
                child: TextFormField(
                    controller: _contentController,
                    minLines: 3,
                    maxLines: null,
                    decoration:
                        const InputDecoration(border: InputBorder.none)))
          ]));
    });
  }

  @override
  void dispose() {
    _contentController.dispose();
    super.dispose();
  }
}
