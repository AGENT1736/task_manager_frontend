import 'package:flutter/material.dart';
import 'package:task_manager/theme/colors.dart';
import 'package:task_manager/widgets/task_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightThemeColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: LightThemeColors.appBarColor,
        title: Text(
          "Taskero",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w900,
            color: LightThemeColors.textColor,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.add,
              color: LightThemeColors.primaryColor,
            ),
          )
        ],
      ),

      //This is the body of the entire page
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Text(
                "Today's task",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            ViewTaskTile(
              title: "Task title",
              subtitle: "Information about the task",
              description: "Description about the task",
            ),
          ],
        ),
      ),
    );
  }
}
