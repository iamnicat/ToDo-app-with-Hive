import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app_with_hive/data/repositories/task_repository.dart';
import 'package:todo_app_with_hive/presentation/widgets/task_tile.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final taskRepository = TaskRepository();
        final taskData = taskRepository.getAllTask(index);

        return TaskTile(
          taskText: taskData.task,
          isChecked: taskData.isDone,
          checkboxCallback: (checkboxState) {
            taskRepository.updateTask(index, taskData);
          },
          onLongPressCallback: () {
            taskRepository.deleteTask(index);
          },
        );
      },
      itemCount: Hive.box('todo_tasks').length,
    );
  }
}
