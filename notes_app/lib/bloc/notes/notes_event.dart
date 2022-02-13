import 'package:equatable/equatable.dart';
import 'package:notes_app/models/note.dart';

abstract class NotesEvent extends Equatable {
  const NotesEvent();

  @override
  List<Object> get props => [];
}

class NotesLoaded extends NotesEvent {
  const NotesLoaded();
}

class NoteAdded extends NotesEvent {
  final Note note;

  const NoteAdded(this.note);

  @override
  List<Object> get props => [note];
}
