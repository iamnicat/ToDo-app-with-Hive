import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskText;
  final Function checkboxCallback;
  final Function onLongPressCallback;

  TaskTile(
      {@required this.taskText,
      @required this.isChecked,
      @required this.checkboxCallback,
      @required this.onLongPressCallback});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: onLongPressCallback,
      child: ListTile(
        title: Text(
          taskText,
          style: TextStyle(
              color: Colors.black,
              decoration: isChecked ? TextDecoration.lineThrough : null),
        ),
        trailing: Checkbox(
          value: isChecked,
          onChanged: checkboxCallback,
        ),
      ),
    );
  }
}
