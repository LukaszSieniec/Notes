import 'package:notes_app/database/notes_database.dart';
import 'package:notes_app/models/note.dart';

class NotesRepository {
  final NotesDatabase _notesDatabase;

  NotesRepository(this._notesDatabase);

  Future<void> createNote(Note note) async => _notesDatabase.createNote(note);

  Future<List<Note>> readNotes() async {
    final List<Note> notes = await _notesDatabase.readNotes();
    return notes;
  }
}
