import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/bloc/add_note/add_note_event.dart';
import 'package:notes_app/bloc/add_note/add_note_state.dart';
import 'package:notes_app/models/note.dart';
import 'package:notes_app/repositories/notes_repository.dart';
import 'package:notes_app/utils/extensions.dart';

class AddNoteBloc extends Bloc<AddNoteEvent, AddNoteState> {
  final NotesRepository _notesRepository;

  AddNoteBloc(this._notesRepository) : super(const AddNoteState()) {
    on<SavedNote>(_onSavedNote);
  }

  Future<void> _onSavedNote(SavedNote event, Emitter<AddNoteState> emit) async {
    emit(state.copyWith(addNoteStatus: AddNoteStatus.loading));

    final String newContent = event.content.removeEmptySpace();

    if (newContent.isEmpty) {
      emit(state.copyWith(addNoteStatus: AddNoteStatus.emptyContent));
    } else {
      try {
        final int creationDate = DateTime.now().millisecondsSinceEpoch;
        final Note note =
            Note(content: event.content, creationDate: creationDate);

        await _notesRepository.createNote(note);
        emit(state.copyWith(note: note, addNoteStatus: AddNoteStatus.success));
      } on Exception {
        emit(state.copyWith(addNoteStatus: AddNoteStatus.failure));
      }
    }
  }
}
