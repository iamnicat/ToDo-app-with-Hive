import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ErrorDialog extends StatelessWidget {
 final AsyncSnapshot<Box<dynamic>> snapshot;

  ErrorDialog({@required this.snapshot});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFE91E63),
      child: AlertDialog(
        title: Text('Error message'),
        content: Text(snapshot.hasError.toString()),
        actions: [
          TextButton(
              onPressed: () {
                exit(0);
              },
              child: Text('Exit'))
        ],
      ),
    );
  }
}
