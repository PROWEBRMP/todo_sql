import 'package:sqllite_example/domain/sql_database/data_models/db_todo.dart';
import 'package:sqllite_example/domain/sql_database/data_models/todo_model.dart';
import 'package:sqllite_example/domain/sql_database/database.dart';

class ToDoRepositories {
  Future<void> addTodo(ToDoModel todo) async {
    await DBProvider.db.addTodo(DBTodo(
      title: todo.title,
      subTitle: todo.subTitle,
      time: todo.time,
    ));
  }

  Future<List<ToDoModel>> getAllTodos() async {
    try {
      final allTodos = await DBProvider.db.getAllTodos();
      List<ToDoModel> todos = allTodos
          .map((todo) => ToDoModel(
                id: todo.id,
                subTitle: todo.subTitle ?? 'Not Data',
                title: todo.title ?? 'Not Data',
                time: todo.time,
              ))
          .toList();
      return todos;
    } catch (e) {
      e;
    }
    return [];
  }

  Future<void> deleteNoteId(int id) async {
    await DBProvider.db.deleteNote(id);
  }

  Future changeNoteData(ToDoModel todo) async {
    final res = await DBProvider.db.changeNoteData(
      DBTodo(
          title: todo.title,
          subTitle: todo.subTitle,
          time: todo.time ?? 'Error',
          id: todo.id),
    );
    return res;
  }
}
