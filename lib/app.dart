import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'page/todo_list_page.dart';
import 'provider/todo_list_succes_provider.dart';
import 'provider/todo_list_unsucces_provider.dart';

class NoteApp extends StatelessWidget {
  const NoteApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const TodoListPage(),
      builder: (context, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) => TodoListUnSuccessProvider(),
            ),
            ChangeNotifierProvider(
              create: (context) => TodoListSuccessProvider(),
            ),
          ],
          child: child ?? const Offstage(),
        );
      },
    );
  }
}
