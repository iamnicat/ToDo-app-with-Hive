import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app_with_hive/data/repositories/task_repository.dart';
import 'package:todo_app_with_hive/presentation/widgets/task_list.dart';
import 'task_add_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TaskPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Color(0xFFE91E63),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFE91E63),
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: TaskAddPage(),
              ),
            ),
          );
        },
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box('todo_tasks').listenable(),
        builder: (BuildContext context, box, Widget child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(
                    top: 60.0, right: 30.0, bottom: 30.0, left: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 30.0,
                      child: Icon(
                        Icons.list,
                        size: 30.0,
                        color: Color(0xFFD81B60),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'EY',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 50.0,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 4.0),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5.0),
                      child: Text(
                        '${TaskRepository().getUnfinishedDataLength()} tasks',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  child: TaskList(),
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
