import 'package:flutter/material.dart';
import 'package:notes/provider/db_provider.dart';
import 'package:notes/resources/themes.dart';
import 'package:notes/screens/edit_screen.dart';
import 'package:notes/screens/home_screen.dart';
import 'package:notes/screens/note_viewer_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DBProvider>(create: (_) => DBProvider())
      ],
      child: MaterialApp(
        theme: lightThemeData(context),
        darkTheme: lightThemeData(context),
        initialRoute: '/',
        routes: {
          '/': (context) => const HomeScreen(),
          'note-viewer': (context) => NoteViewer(),
          'insert-edit': ((context) => NoteEditScreen())
        },
      ),
    );
  }
}
