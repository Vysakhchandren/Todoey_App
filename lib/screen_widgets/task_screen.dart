import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_app/task_data.dart';
import 'package:todoey_app/screen_widgets/add_task_screen.dart';

import '../models/task.dart';
import '../widgets/task_list.dart';
import 'add_task_screen.dart';

class TaskScreen extends StatefulWidget {
  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  // List<Task> tasks = [
  //   Task(name: 'Buy milk'),
  //   Task(name: 'Buy eggs'),
  //   Task(name: 'Buy bread'),
  // ];

  @override
  Widget build(BuildContext context) {
    final tasksProvider = Provider.of<TaskData>(context);
    final tasks = tasksProvider.tasks;

    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => AddTaskScreen((newTaskTitle) {
              tasksProvider.addTask(newTaskTitle);

            }),
          );
        },
        shape: CircleBorder(),
        child: Icon(Icons.add),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 60, left: 30, right: 30, bottom: 30),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  child: Icon(
                    Icons.list,
                    color: Colors.lightBlueAccent,
                    size: 50,
                  ),
                  radius: 30,
                  backgroundColor: Colors.white,
                ),
                SizedBox(height: 10),
                Text(
                  'Todoey',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  '${tasks.length} Tasks',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: Colors.white,
              ),
              child: TasksList(),
            ),
          ),
        ],
      ),
    );
  }
}
