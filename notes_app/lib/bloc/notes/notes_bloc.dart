import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/bloc/notes/notes_event.dart';
import 'package:notes_app/bloc/notes/notes_state.dart';
import 'package:notes_app/models/note.dart';
import 'package:notes_app/repositories/notes_repository.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {
  final NotesRepository _notesRepository;

  NotesBloc(this._notesRepository) : super(const NotesState()) {
    on<NotesLoaded>(_onNotesLoaded);
  }

  Future<void> _onNotesLoaded(
      NotesLoaded event, Emitter<NotesState> emit) async {
    emit(state.copyWith(notesStatus: NotesStatus.loading));
    try {
      final List<Note> notes = await _notesRepository.readNotes();

      emit(state.copyWith(notes: notes, notesStatus: NotesStatus.success));
    } on Exception {
      emit(state.copyWith(notesStatus: NotesStatus.failure));
    }
  }
}
