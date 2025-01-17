import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:test_app/model/todo_model.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  static late Database _database;

  final String _tableName = 'todo';

  DatabaseHelper.internal() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper.internal();

  Future<Database> get database async {
    _database = await _initDb();

    return _database;
  }

  Future<Database> _initDb() async {
    var db = openDatabase(
      join(await getDatabasesPath(), 'todo.db'),
      onCreate: (db, version) {
        return db.execute(
            'CREATE TABLE $_tableName(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, description TEXT, isDone INTEGER)');
      },
      version: 1,
    );

    return db;
  }

  Future<void> insertTodo(TodoModel todo) async {
    final db = await database;

    await db.insert(_tableName, todo.toJson());
  }

  Future<List<TodoModel>> getTodos() async {
    final db = await database;

    final List<Map<String, dynamic>> result = await db.query(_tableName);

    return result.map((e) => TodoModel.fromJson(e)).toList();
  }

  Future<void> updateTodo(TodoModel todo) async {
    final db = await database;

    await db.update(_tableName, todo.toJson(),
        where: 'id = ?', whereArgs: [todo.id]);
  }

  Future<void> deleteTodo(TodoModel todo) async {
    final db = await database;

    await db.delete(_tableName, where: 'id = ?', whereArgs: [todo.id]);
  }
}
