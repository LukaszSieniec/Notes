import 'package:flutter/material.dart';
import 'package:notes_app/bloc/add_note/add_note_bloc.dart';
import 'package:notes_app/bloc/add_note/add_note_event.dart';
import 'package:notes_app/bloc/add_note/add_note_state.dart';
import 'package:notes_app/constants/app_constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/utils/size_config.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({Key? key}) : super(key: key);

  @override
  _AddNoteScreenState createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  final TextEditingController _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return BlocConsumer<AddNoteBloc, AddNoteState>(listener: (context, state) {
      if (state.addNoteStatus == AddNoteStatus.emptyContent) {
      } else if (state.addNoteStatus == AddNoteStatus.success) {
        Navigator.pop(context);
      } else if (state.addNoteStatus == AddNoteStatus.failure) {}
    }, builder: (context, state) {
      return Scaffold(
          backgroundColor: const Color(AppColors.background),
          appBar: AppBar(
              title: Text(AppLabels.addNote,
                  style:
                      TextStyle(fontSize: SizeConfig.blockSizeVertical * 3.35)),
              centerTitle: true,
              backgroundColor: Colors.transparent,
              elevation: 0,
              automaticallyImplyLeading: false,
              actions: [
                IconButton(
                    onPressed: () => context
                        .read<AddNoteBloc>()
                        .add(SavedNote(_contentController.text)),
                    icon: Icon(Icons.save,
                        size: SizeConfig.blockSizeVertical * 4.0))
              ]),
          body: Column(children: [
            Divider(
                height: SizeConfig.blockSizeVertical * 0.30,
                color: Colors.white),
            Container(
                margin: EdgeInsets.only(
                    left: SizeConfig.blockSizeHorizontal * 8.90,
                    top: SizeConfig.blockSizeVertical * 4.45,
                    right: SizeConfig.blockSizeHorizontal * 8.90),
                padding: EdgeInsets.only(
                    left: SizeConfig.blockSizeHorizontal * 4.45,
                    right: SizeConfig.blockSizeHorizontal * 4.45),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                        Radius.circular(SizeConfig.blockSizeVertical * 2.25)),
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
