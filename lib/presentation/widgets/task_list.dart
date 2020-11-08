import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app_with_hive/data/repositories/task_repository.dart';
import 'package:todo_app_with_hive/presentation/widgets/task_tile.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) {
      final taskData = TaskRepository().getAllTask(index);

      return TaskTile(
        taskText: taskData.task,
        isChecked: taskData.isDone,
      );
    },
      itemCount: Hive.box('todo_tasks').length,

    );
  }
}
