import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:sqllite_example/domain/providers/note_provider/note_provider.dart';
import 'package:sqllite_example/ui/app_navigator/app_routes.dart';
import 'package:sqllite_example/ui/theme/app_colors.dart';

class HomePageAddBtn extends StatelessWidget {
  const HomePageAddBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<NoteProvider>(context);
    return FloatingActionButton(
      onPressed: () {
        model.clearControllers();
        Navigator.of(context).pushNamed(AppRoutes.addNote);
      },
      elevation: 2,
      backgroundColor: AppColors.primaryBgColor,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
      child: const Icon(
        Icons.edit,
        color: AppColors.btnTextColor,
      ),
    );
  }
}
