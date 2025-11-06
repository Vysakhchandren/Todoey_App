import 'dart:collection';

import 'package:flutter/material.dart';

import 'models/task.dart';

class TaskData extends ChangeNotifier{

  List<Task> _tasks = [];

  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);

  //List<Task> get tasks => _tasks;
int get taskCount {
  return _tasks.length;
}

  void addTask(String newTaskTitle){
  final task = Task(name: newTaskTitle);
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task){
    task.toggleDone();
    notifyListeners();
  }


  void removeTask(Task task){
    _tasks.remove(task);
    notifyListeners();
  }
}
