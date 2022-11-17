// ignore_for_file: depend_on_referenced_packages
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqllite_example/domain/sql_database/data_models/db_todo.dart';

class DBProvider {
  static final DBProvider db = DBProvider();

  Database? _database;

  Future<Database> get database async {
    // if (database != null) return _database!;
    _database = await initDb();
    return _database!;
  }

  initDb() async {
    Directory directory = await getApplicationSupportDirectory();
    String path = join(directory.path, 'MyDB.db');
    return await openDatabase(path, version: 1, onOpen: (db) async {},
        onCreate: (Database db, int version) async {
      // execute - запросы к базе данных
      // Настройка и создание базы данных
      await db.execute("CREATE TABLE MY_NOTES ("
          "id INTEGER PRIMARY KEY AUTOINCREMENT,"
          "title TEXT,"
          "subTitle TEXT,"
          "time TEXT"
          ")");
    });
  }

  addTodo(DBTodo todo) async {
    final db = await database;
    var raw = await db.rawInsert(
      "INSERT Into MY_NOTES(title,subTitle,time)"
      "VALUES (?,?,?)",
      [todo.title, todo.subTitle, todo.time],
    );
    return raw;
  }

  Future<List<DBTodo>> getAllTodos() async {
    final db = await database;
    var res = await db.query('MY_NOTES');
    List<DBTodo> list =
        res.isNotEmpty ? res.map((e) => DBTodo.fromJson(e)).toList() : [];
    return list;
  }

  deleteNote(int id) async {
    final db = await database;
    return db.delete('MY_NOTES', where: 'id = ?', whereArgs: [id]);
  }

  changeNoteData(DBTodo todo) async {
    final db = await database;
    var res = await db.update(
      'MY_NOTES',
      todo.toJson(),
      where: "id = ?",
      whereArgs: [todo.id],
    );

    return res;
  }
}
