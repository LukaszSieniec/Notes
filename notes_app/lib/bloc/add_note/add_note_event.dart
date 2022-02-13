import 'package:equatable/equatable.dart';

abstract class AddNoteEvent extends Equatable {
  const AddNoteEvent();
}

class SavedNote extends AddNoteEvent {
  final String content;

  const SavedNote(this.content);

  @override
  List<Object> get props => [content];
}
