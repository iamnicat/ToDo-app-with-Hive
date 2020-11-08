import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskText;
  final Function checkboxCallback;


  TaskTile({@required this.taskText, @required this.isChecked,@required this.checkboxCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskText,
        style: TextStyle(
            color: Colors.black,
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        value: isChecked, onChanged: checkboxCallback,
      ),
    );
  }
}
