import 'package:todo_app_with_hive/data/models/todo_data.dart';
import 'package:hive/hive.dart';

class TaskRepository {
  TodoData todoData;

  TaskRepository({this.todoData});

  Box taskBox = Hive.box('todo_tasks');

  void addTask(TodoData todoData) {
    taskBox.add(todoData);
  }

  TodoData getAllTask(int index) {
    return taskBox.getAt(index);
  }
}
