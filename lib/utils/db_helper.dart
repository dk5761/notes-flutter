import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static Future database() async {
    final databasePath = await getDatabasesPath();

    return openDatabase(join(databasePath, 'notes12.db'),
        onCreate: (db, version) {
      return db.execute(
          "CREATE TABLE notes(id TEXT PRIMARY KEY, title TEXT, body TEXT, dt datetime)");
    }, version: 1);
  }

  static Future insert(Map<String, dynamic> data) async {
    final database = await DBHelper.database();
    // print("data $data");
    database.insert("notes", data,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future delete(String id) async {
    final database = await DBHelper.database();

    return database.delete("notes", where: "id=?", whereArgs: [id]);
  }

  static Future<List<Map<String, dynamic>>> getAllItems() async {
    final db = await DBHelper.database();

    return db.query("notes", orderBy: "dt DESC");
  }
}
