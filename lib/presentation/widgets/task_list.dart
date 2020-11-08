import 'package:flutter/material.dart';
import 'package:todo_app_with_hive/data/repositories/task_repository.dart';
import 'package:todo_app_with_hive/presentation/widgets/task_tile.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final taskRepository = TaskRepository();
    return ListView.builder(
      itemBuilder: (context, index) {
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
      itemCount: taskRepository.getDataLength(),
    );
  }
}
