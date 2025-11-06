import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  final Function addTaskCallback;

  AddTaskScreen(this.addTaskCallback);

  @override
  Widget build(BuildContext context) {
    String? newTaskTitle;
    return Container(
      padding: EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Add Task',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              color: Colors.lightBlueAccent,
              fontWeight: FontWeight.w500,
            ),
          ),
          TextField(
            autofocus: true,
            textAlign: TextAlign.center,
            onChanged: (newText) {
              newTaskTitle = newText;
            },
            // decoration: InputDecoration(),
          ),
          SizedBox(height: 10),
          TextButton(
            child: Text('Add', style: TextStyle(color: Colors.white)),
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Colors.lightBlueAccent)
            ),
            onPressed: () {
              addTaskCallback(newTaskTitle);
              Navigator.pop(context);
            },
          ),
        ],
      ),
      //child: Text('Add Task'),
    );
  }
}
