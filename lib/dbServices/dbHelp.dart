// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/note.dart';

class Db {
  static Database? _db;
  Future<Database?> get db async {
    if (_db == null) {
      return _db = await initDb();
    } else {
      return _db;
    }
  }

  //init database
  initDb() async {
    String pathDb = await getDatabasesPath();
    String path = join(pathDb, 'taher.db');
    Database? myDb = await openDatabase(path,
        onCreate: _onCreate, version: 1, onUpgrade: _onUpgrade);
    return myDb;
  }

  _onCreate(Database db, int version) async {
    Batch _batch = db.batch();
    _batch.execute("""
CREATE TABLE 'notes'(
  'id' INTEGER NOT NULL PRIMARY KEY  AUTOINCREMENT,
        'title' TEXT NOT NULL,
        'content' TEXT NOT NULL,
        'date' TEXT NOT NULL
)
""");
    await _batch.commit();
    print(".....Database created.....");
  }

  _onUpgrade(Database db, int oldVersion, int newVersion) async {
    // await db.execute("ALTER TABLE 'notes' ADD COLUMN color TEXT");
    // print("------------On upgared------------");
  }

//read data (select)
  Future<List<Note>> readNotes() async {
    Database? dbb = await db;
    List<Map<String, dynamic>> response = await dbb!.query('notes');
    //return response;
    return List.generate(
      response.length,
      (index) {
        return Note(
          id: response[index]["id"],
          title: response[index]["title"],
          content: response[index]["content"],
          date: response[index]["date"],
        );
      },
    );
  }

  //delete data (delete)
  Future<int> deleteNote(Note note) async {
    Database? dbb = await db;
    int response =
        await dbb!.delete("notes", where: "id = ?", whereArgs: [note.id]);
    return response;
  }

  //update data (update)
  Future<int> updateNote(Note note) async {
    Database? dbb = await db;
    int response = await dbb!
        .update("notes", note.toMap(), where: "id = ?", whereArgs: [note.id]);
    return response;
  }

  //insert data (insert)
  Future<int> insertNote(Note note) async {
    Database? dbb = await db;
    int response = await dbb!.insert("notes", note.toMap());
    return response;
  }

//delete all database
  deleteMyDatabase() async {
    // String pathdb = await getDatabasesPath();
    // String path = join(pathdb, 'taher.db');
    // await deleteDatabase(path);
    Database? dbb = await db;
    return await dbb!.delete('notes');
  }
}
