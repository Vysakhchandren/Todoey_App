import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_app/task_data.dart';
import 'package:todoey_app/screen_widgets/task_screen.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(builder: (context, child) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
          home: TaskScreen(),
      );}, create: (BuildContext context) => TaskData(),
    );
  }
}


