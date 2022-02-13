import 'package:equatable/equatable.dart';
import 'package:notes_app/models/note.dart';

enum NotesStatus { initial, loading, success, failure }

class NotesState extends Equatable {
  final List<Note> notes;

  final NotesStatus notesStatus;

  const NotesState(
      {this.notes = const [], this.notesStatus = NotesStatus.initial});

  NotesState copyWith({List<Note>? notes, NotesStatus? notesStatus}) =>
      NotesState(
          notes: notes ?? this.notes,
          notesStatus: notesStatus ?? this.notesStatus);

  @override
  List<Object> get props => [notes, notesStatus];
}
