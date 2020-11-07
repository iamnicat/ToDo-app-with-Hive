import 'package:flutter/material.dart';
import 'package:todo_app_with_hive/presentation/pages/task_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TaskPage(),
    );
  }
}
