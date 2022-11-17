import 'package:flutter/cupertino.dart';
import 'package:sqllite_example/ui/app_navigator/app_routes.dart';
import 'package:sqllite_example/ui/pages/add_note_page/add_note_page.dart';
import 'package:sqllite_example/ui/pages/change_page/change_page.dart';
import 'package:sqllite_example/ui/pages/home_page/home_page.dart';

abstract class AppNavigator {
  static const String initRoute = AppRoutes.home;

  static Map<String, WidgetBuilder> get routes {
    return {
      AppRoutes.home: (_) => const HomePage(),
      AppRoutes.addNote: (_) => const AddNotePage(),
      AppRoutes.changeNote: (_) => const ChangePage(),
    };
  }
}
