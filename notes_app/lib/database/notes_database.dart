import 'package:notes_app/database/notes_dao.dart';
import 'package:notes_app/models/note.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class NotesDatabase {
  static final NotesDatabase _instance = NotesDatabase._internal();

  static Database? _database;

  static NotesDatabase get = _instance;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  NotesDatabase._internal();

  Future<Database> _initDatabase() async {
    final String databasePath = await getDatabasesPath();
    final String path = join(databasePath, 'notes.db');

    return await openDatabase(path, version: 1, onCreate: _createDatabase);
  }

  Future<void> _createDatabase(Database database, int version) async {
    await database.execute(NotesDao.createNotesTableQuery);
  }

  Future<void> close() async {
    final Database database = await _instance.database;
    database.close();
  }

  Future<void> createNote(Note note) async {
    final Database database = await _instance.database;
    database.insert(NotesDao.notesTableName, note.toJson());
  }

  Future<List<Note>> readNotes() async {
    final Database database = await _instance.database;

    final List<Map<String, dynamic>> maps =
        await database.query(NotesDao.notesTableName);

    return maps.map((json) => Note.fromJson(json)).toList();
  }
}
