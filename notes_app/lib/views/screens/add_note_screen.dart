import 'package:flutter/material.dart';
import 'package:notes_app/constants/app_constants.dart';

class AddNoteScreen extends StatelessWidget {
  const AddNoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(AppColors.background),
        appBar: AppBar(
            title:
                const Text(AppLabels.addNote, style: TextStyle(fontSize: 24.0)),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            automaticallyImplyLeading: false,
            actions: [
              IconButton(
                  onPressed: () => print('onPressed!'),
                  icon: const Icon(Icons.save, size: 24.0))
            ]),
        body: Column(children: [
          const Divider(height: 2.0, color: Colors.white),
          Container(
              margin: const EdgeInsets.only(left: 32.0, top: 32.0, right: 32.0),
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  color: Colors.white),
              child: TextFormField(
                  minLines: 3,
                  maxLines: null,
                  decoration: const InputDecoration(border: InputBorder.none)))
        ]));
  }
}
