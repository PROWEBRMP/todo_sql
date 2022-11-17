import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqllite_example/domain/providers/note_provider/note_provider.dart';
import 'package:sqllite_example/domain/sql_database/data_models/todo_model.dart';
import 'package:sqllite_example/ui/app_navigator/app_routes.dart';
import 'package:sqllite_example/ui/theme/app_colors.dart';
import 'package:sqllite_example/ui/theme/app_text_styles.dart';

class NoteListItem extends StatelessWidget {
  final ToDoModel todoModel;
  const NoteListItem({Key? key, required this.todoModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<NoteProvider>(context);
    return GestureDetector(
      onTap: () {
        model.setControllers(todoModel);
        showModalBottomSheet(
          context: context,
          backgroundColor: Colors.transparent,
          builder: (context) => Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.all(16),
            height: 200,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: BottomMenuContent(
              todoModel: todoModel,
            ),
          ),
        );
      },
      child: NoteListItemContent(
        title: todoModel.title,
        date: todoModel.time ?? 'Error',
        note: todoModel.subTitle,
      ),
    );
  }
}

class BottomMenuContent extends StatelessWidget {
  final ToDoModel todoModel;

  const BottomMenuContent({Key? key, required this.todoModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 50,
          height: 3,
          decoration: BoxDecoration(
              color: Colors.grey, borderRadius: BorderRadius.circular(16)),
        ),
        const SizedBox(height: 16),
        Text(
          todoModel.title,
          style: const TextStyle(fontSize: 18),
        ),
        const Spacer(),
        BottomMenuBtn(
          textBtn: 'Редактировать',
          btnAction: () {
            Navigator.of(context).pushNamed(
              AppRoutes.changeNote,
              arguments: todoModel,
            );
          },
        ),
        BottomMenuBtn(
          textBtn: 'Удалить',
          btnAction: () {},
        ),
      ],
    );
  }
}

class BottomMenuBtn extends StatelessWidget {
  final String textBtn;
  final Function btnAction;
  const BottomMenuBtn({
    super.key,
    this.textBtn = '',
    required this.btnAction,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => btnAction(),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.transparent),
        elevation: MaterialStateProperty.all(0),
      ),
      child: SizedBox(
        height: 52,
        child: Row(
          children: <Widget>[
            const Icon(
              Icons.edit,
              color: AppColors.secondaryDarkColor,
            ),
            const SizedBox(width: 16),
            Text(
              textBtn,
              style: const TextStyle(
                fontSize: 16,
                color: AppColors.secondaryDarkColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NoteListItemContent extends StatelessWidget {
  const NoteListItemContent({
    Key? key,
    required this.title,
    required this.date,
    required this.note,
  }) : super(key: key);

  final String title;
  final String date;
  final String note;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minHeight: 117,
      ),
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xffF7F2F9),
        borderRadius: BorderRadius.circular(16),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, .3),
            blurRadius: 2,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTextStyles.noteTitle),
          const SizedBox(height: 5),
          Text(date, style: AppTextStyles.noteDate),
          const SizedBox(height: 9),
          Text(note, style: AppTextStyles.note),
        ],
      ),
    );
  }
}

class NoteControlBtn extends StatelessWidget {
  final String btnText;
  final IconData btnIcon;
  final Function onPressed;
  const NoteControlBtn({
    Key? key,
    this.btnText = '',
    this.btnIcon = Icons.edit,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: double.infinity,
      child: TextButton.icon(
        icon: Icon(
          btnIcon,
          size: 24,
          color: AppColors.secondaryDarkColor,
        ),
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
              side: BorderSide.none,
            ),
          ),
        ),
        onPressed: () => onPressed(),
        label: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(width: 16),
            Text(
              btnText,
              style: AppTextStyles.noteTitle.copyWith(height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}
