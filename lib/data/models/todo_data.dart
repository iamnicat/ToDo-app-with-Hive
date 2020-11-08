import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

part 'todo_data.g.dart';

@HiveType(typeId: 1)
class TodoData {
  @HiveField(0)
  String task;
  @HiveField(1)
  bool isDone;

  TodoData({@required this.task, this.isDone = false});
}
