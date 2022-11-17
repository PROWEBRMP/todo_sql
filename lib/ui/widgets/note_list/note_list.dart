import 'package:flutter/material.dart';

import 'package:sqllite_example/domain/sql_database/data_models/todo_model.dart';
import 'package:sqllite_example/domain/sql_database/todo_repositories.dart';
import 'package:sqllite_example/ui/widgets/note_list_item/note_list_item.dart';

class NoteListWidget extends StatelessWidget {
  const NoteListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ToDoModel>>(
      stream: Stream.fromFuture(ToDoRepositories().getAllTodos()),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        final notes = snapshot.data;
        return notes!.isNotEmpty
            ? ListView.separated(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                itemBuilder: (context, i) => NoteListItem(
                  todoModel: notes[i],
                ),
                itemCount: notes.length,
                separatorBuilder: (context, i) => const SizedBox(height: 16),
              )
            : const Center(
                child: Text(
                  'Нет заметок',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              );
      },
    );
  }
}
