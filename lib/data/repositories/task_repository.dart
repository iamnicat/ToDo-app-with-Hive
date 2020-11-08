import 'package:todo_app_with_hive/data/models/todo_data.dart';
import 'package:hive/hive.dart';

class TaskRepository {
  final TodoData todoData;

  TaskRepository({this.todoData});

  Box _taskBox = Hive.box('todo_tasks');

  var _filteredData = Hive.box('todo_tasks').values.where((element) {
    return element.isDone == false;
  });

  void addTask(TodoData todoData) {
    _taskBox.add(todoData);
  }

  TodoData getAllTask(int index) {
    return _taskBox.getAt(index);
  }

  void updateTask(int index, TodoData todoData) {
    _taskBox.putAt(
        index, TodoData(task: todoData.task, isDone: !todoData.isDone));
  }

  void deleteTask(int index) {
    _taskBox.deleteAt(index);
  }

  int getDataLength() => _taskBox.length;

  int getUnfinishedDataLength() => _filteredData.length;
}
