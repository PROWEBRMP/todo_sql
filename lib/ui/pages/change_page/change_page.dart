import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqllite_example/domain/providers/note_provider/note_provider.dart';
import 'package:sqllite_example/domain/sql_database/data_models/todo_model.dart';
import 'package:sqllite_example/ui/theme/app_colors.dart';
import 'package:sqllite_example/ui/theme/app_text_styles.dart';
import 'package:sqllite_example/ui/widgets/app_bar_shadow/app_bar_shadow.dart';
import 'package:sqllite_example/ui/widgets/note_control_text_field/note_control_text_field.dart';

class ChangePage extends StatelessWidget {
  const ChangePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<NoteProvider>(context);
    final getTodo = ModalRoute.of(context)?.settings.arguments;
    final setTodo = getTodo is ToDoModel
        ? getTodo
        : ToDoModel(subTitle: 'Error', title: 'Error');
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Изменить заметку',
          style: AppTextStyles.appBartitle,
        ),
        flexibleSpace: const AppBarShadow(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: <Widget>[
            NoteControlTextField(
              textFieldTitle: 'Заголовок',
              maxLines: 1,
              controller: model.titleController,
            ),
            const SizedBox(height: 16),
            NoteControlTextField(
              textFieldTitle: 'Заметка',
              maxLines: 2,
              controller: model.noteController,
            ),
            const SizedBox(height: 16),
            ChangeNoteBtn(
              btnAction: () {
                model.changeNoteData(context, setTodo);
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      ),
    );
  }
}

class ChangeNoteBtn extends StatelessWidget {
  final Function btnAction;
  const ChangeNoteBtn({
    Key? key,
    required this.btnAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.3),
            blurRadius: 2,
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.15),
            blurRadius: 3,
            spreadRadius: 1,
          ),
        ],
      ),
      width: double.infinity,
      child: FloatingActionButton.extended(
        backgroundColor: AppColors.primaryBgColor,
        elevation: 0,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide.none,
        ),
        heroTag: 'change-note-btn',
        onPressed: () => btnAction(),
        label:  Text(
          'Изменить',
          style: TextStyle(
            fontSize: 14,
            color: AppColors.btnTextColor,
            height: 1.42,
          ),
        ),
      ),
    );
  }
}
