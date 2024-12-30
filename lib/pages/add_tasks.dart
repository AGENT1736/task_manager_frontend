import 'package:flutter/material.dart';
import 'package:task_manager/theme/colors.dart';

class AddTasks extends StatelessWidget {
  const AddTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightThemeColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: LightThemeColors.appBarColor,
        title: Text("Add Task"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.check,
            ),
          ),
        ],
      ),
    );
  }
}
