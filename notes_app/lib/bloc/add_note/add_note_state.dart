import 'package:equatable/equatable.dart';
import 'package:notes_app/models/note.dart';

enum AddNoteStatus { initial, loading, success, failure }

class AddNoteState extends Equatable {
  final Note? note;

  final AddNoteStatus addNoteStatus;

  const AddNoteState({this.note, this.addNoteStatus = AddNoteStatus.initial});

  AddNoteState copyWith({Note? note, AddNoteStatus? addNoteStatus}) =>
      AddNoteState(
          note: note ?? this.note,
          addNoteStatus: addNoteStatus ?? this.addNoteStatus);

  @override
  List<Object?> get props => [note, addNoteStatus];
}
