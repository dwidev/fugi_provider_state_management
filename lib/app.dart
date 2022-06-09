import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'page/todo_list_page.dart';
import 'provider/form_todo_provider.dart';
import 'provider/todo_list_done_provider.dart';
import 'provider/todo_list_provider.dart';

class NoteApp extends StatelessWidget {
  const NoteApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TodoListPovider(),
        ),
        Provider(create: (context) => FormTodoProvider()),
        ChangeNotifierProvider(
          create: (context) => TodoListDoneProvider(),
        )
      ],
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.purple),
        home: const TodoListPage(),
        builder: (context, child) {
          return child ?? const Offstage();
        },
      ),
    );
  }
}
