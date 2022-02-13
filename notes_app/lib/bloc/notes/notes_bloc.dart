import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/bloc/add_note/add_note_bloc.dart';
import 'package:notes_app/bloc/add_note/add_note_state.dart';
import 'package:notes_app/bloc/notes/notes_event.dart';
import 'package:notes_app/bloc/notes/notes_state.dart';
import 'package:notes_app/models/note.dart';
import 'package:notes_app/repositories/notes_repository.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {
  final NotesRepository _notesRepository;

  final AddNoteBloc _addNoteBloc;
  late final StreamSubscription _addNoteSubscription;

  NotesBloc(this._notesRepository, this._addNoteBloc)
      : super(const NotesState()) {
    on<NotesLoaded>(_onNotesLoaded);
    on<NoteAdded>(_onNoteAdded);

    void onAddNoteStateChanged(AddNoteState addNoteState) {
      if (addNoteState.addNoteStatus == AddNoteStatus.success) {
        add(NoteAdded(addNoteState.note!));
      }
    }

    _addNoteSubscription = _addNoteBloc.stream.listen(onAddNoteStateChanged);
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

  Future<void> _onNoteAdded(NoteAdded event, Emitter<NotesState> emit) async {
    List<Note> updatedNotes = [...state.notes, event.note];
    emit(state.copyWith(notes: updatedNotes));
  }

  @override
  Future<void> close() {
    _addNoteSubscription.cancel();
    return super.close();
  }
}
