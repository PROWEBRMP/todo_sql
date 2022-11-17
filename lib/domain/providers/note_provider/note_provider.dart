import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqllite_example/domain/sql_database/data_models/todo_model.dart';
import 'package:sqllite_example/domain/sql_database/todo_repositories.dart';

class NoteProvider extends ChangeNotifier {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController noteController = TextEditingController();

  List<ToDoModel> todosList = [];

  Future<List<ToDoModel>> getAllTodos() async {
    todosList = await ToDoRepositories().getAllTodos();
    print(todosList);
    return todosList;
  }

  void addNote(BuildContext context) {
    ToDoRepositories()
        .addTodo(
          ToDoModel(
            subTitle: noteController.text.isEmpty
                ? 'Нет заметки'
                : noteController.text.trim(),
            title: titleController.text.isEmpty
                ? 'Нет заголовка'
                : titleController.text.trim(),
          ),
        )
        .then((value) => Navigator.of(context).pop())
        .then((value) => clearControllers());

    titleController.clear();
    noteController.clear();
    notifyListeners();
  }

  void changeNoteData(BuildContext context, ToDoModel todo) {
    final newTodo = ToDoModel(
      subTitle: noteController.text,
      title: titleController.text,
      id: todo.id,
    );

    ToDoRepositories()
        .changeNoteData(newTodo)
        .then((value) => Navigator.of(context).pop());
    notifyListeners();
  }

  void setControllers(ToDoModel todo) {
    noteController.text = todo.subTitle;
    titleController.text = todo.title;
    notifyListeners();
  }

  void clearControllers() {
    noteController.clear();
    titleController.clear();
    notifyListeners();
  }

  void deleteNote(int id) {
    ToDoRepositories().deleteNoteId(id);
    notifyListeners();
  }
}
