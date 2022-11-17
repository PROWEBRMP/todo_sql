import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';
import 'package:sqllite_example/domain/providers/note_provider/note_provider.dart';
import 'package:sqllite_example/ui/app_navigator/app_navigator.dart';
import 'package:sqllite_example/ui/theme/app_colors.dart';

class NoteApp extends StatelessWidget {
  const NoteApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<NoteProvider>(
          create: (context) => NoteProvider(),
        ),
      ],
      child: const AppContent(),
    );
  }
}

class AppContent extends StatelessWidget {
  const AppContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppNavigator.initRoute,
      routes: AppNavigator.routes,
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
          ),
          toolbarHeight: 64,
          centerTitle: true,
          iconTheme: IconThemeData(
            color: AppColors.secondaryDarkColor,
          ),
        ),
      ),
    );
  }
}
