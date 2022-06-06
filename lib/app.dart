import 'package:flutter/material.dart';

import 'page/todo_list_page.dart';

class NoteApp extends StatelessWidget {
  const NoteApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const TodoListPage(),
      builder: (context, child) {
        return child ?? const Offstage();
      },
    );
  }
}
