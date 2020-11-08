import 'package:flutter/material.dart';
import 'package:todo_app_with_hive/data/models/todo_data.dart';
import 'package:todo_app_with_hive/presentation/pages/task_page.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app_with_hive/presentation/widgets/error_dialog.dart';
import 'package:todo_app_with_hive/presentation/widgets/progress_indicator.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TodoDataAdapter());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder(
        future: Hive.openBox('todo_tasks'),
        builder: (BuildContext context, AsyncSnapshot<Box<dynamic>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return ErrorDialog(snapshot: snapshot);
            } else {
              return TaskPage();
            }
          } else {
            return CustomProgressIndicator();
          }
        },
      ),
    );
  }
}
