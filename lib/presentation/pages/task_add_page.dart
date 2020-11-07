import 'package:flutter/material.dart';

class TaskAddPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF757575),
        border: Border.all(color: Color(0xFF757575)),
      ),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFFE91E63),
                fontSize: 30.0,
              ),
            ),
            TextField(
                autofocus: true,
                textAlign: TextAlign.center,
                cursorColor: Color(0xFFE91E63),
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFE91E63)),
                  ),
                ),
                onChanged: (value) {}),
            FlatButton(
              onPressed: () {},
              child: Text(
                'Add Task',
                style: TextStyle(color: Colors.white),
              ),
              color: Color(0xFFE91E63),
            )
          ],
        ),
      ),
    );
  }
}
