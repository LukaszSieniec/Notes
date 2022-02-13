class NotesDao {
  static const String notesTableName = 'notes';
  static const String noteContent = 'content';
  static const String noteCreationDate = 'creation_date';

  static String get createNotesTableQuery =>
      "CREATE TABLE IF NOT EXISTS $notesTableName($noteCreationDate INT PRIMARY KEY,"
          " $noteContent TEXT)";
}
