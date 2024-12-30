import 'package:flutter/material.dart';
import 'package:task_manager/pages/add_tasks.dart';
import 'package:task_manager/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: HomePage(),
      routes: {
        'home_page': (context) => HomePage(),
        'add_tasks': (context) => AddTasks(),
      },
    );
  }
}
