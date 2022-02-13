import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/bloc/add_note/add_note_bloc.dart';
import 'package:notes_app/repositories/notes_repository.dart';
import 'package:notes_app/views/screens/home_screen.dart';

import 'bloc/notes/notes_bloc.dart';
import 'bloc/notes/notes_event.dart';
import 'database/notes_database.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) =>
                  AddNoteBloc(NotesRepository(NotesDatabase.get))),
          BlocProvider(
              create: (context) => NotesBloc(NotesRepository(NotesDatabase.get),
                  BlocProvider.of<AddNoteBloc>(context))
                ..add(const NotesLoaded()))
        ],
        child: const MaterialApp(
            debugShowCheckedModeBanner: false, home: HomeScreen()));
  }
}
