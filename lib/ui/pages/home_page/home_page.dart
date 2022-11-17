import 'package:flutter/material.dart';
import 'package:sqllite_example/ui/theme/app_text_styles.dart';
import 'package:sqllite_example/ui/widgets/app_bar_shadow/app_bar_shadow.dart';
import 'package:sqllite_example/ui/widgets/home_page_add_btn/home_page_add_btn.dart';
import 'package:sqllite_example/ui/widgets/note_list/note_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        flexibleSpace: const AppBarShadow(),
        title: const Text(
          'Заметки',
          style: AppTextStyles.appBartitle,
        ),
      ),
      body: const NoteListWidget(),
      floatingActionButton: const HomePageAddBtn(),
    );
  }
}
