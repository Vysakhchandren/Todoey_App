import 'package:flutter/material.dart';
import 'package:todoey_app/widgets/task_tile.dart';

import '../models/task.dart';

class TasksList extends StatefulWidget {

  final List<Task> tasks;
  TasksList(this.tasks);

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final task = widget.tasks[index];
        return TaskTile(
          isChecked: task.isDone,
          taskTitle: task.name,
          checkboxCallback: (checkboxState){
            setState(() {
              task.toggleDone();
            });
          },

        );
      },itemCount: widget.tasks.length,
    );
  }
}
