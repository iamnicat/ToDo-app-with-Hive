import 'package:todo_app_with_hive/data/models/todo_data.dart';
import 'package:hive/hive.dart';

class TaskRepository {
  TodoData todoData;

  TaskRepository({this.todoData});

  Box taskBox = Hive.box('todo_tasks');

  var _filteredData = Hive.box('todo_tasks').values.where((element) {
    return element.isDone == false;
  });

  void addTask(TodoData todoData) {
    taskBox.add(todoData);
  }

  TodoData getAllTask(int index) {
    return taskBox.getAt(index);
  }

  void updateTask(int index, TodoData todoData) {
    taskBox.putAt(
        index, TodoData(task: todoData.task, isDone: !todoData.isDone));
  }

  void deleteTask(int index) {
    taskBox.deleteAt(index);
  }

  int getDataLength() => taskBox.length;

  int getUnfinishedDataLength() => _filteredData.length;
}
