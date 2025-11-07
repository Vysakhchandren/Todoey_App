import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_app/widgets/task_tile.dart';

import '../models/task.dart';
import '../task_data.dart';

class TasksList extends StatefulWidget {

  // final List<Task> tasks;
  // TasksList(this.tasks);

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (BuildContext context, taskData, Widget? child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return TaskTile(
              isChecked: task.isDone,
              taskTitle: task.name,
              checkboxCallback: (checkboxState) {
                setState(() {
                  task.toggleDone();
                });
              },
              longPressCallback: () {
                taskData.deleteTask(task);
              },
            );
          }, itemCount: taskData.taskCount,
        );
      },
    );
  }
}
