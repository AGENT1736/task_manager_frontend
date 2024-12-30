import 'package:flutter/material.dart';
import 'package:task_manager/theme/colors.dart';
import 'package:task_manager/widgets/task_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> data = [
      {
        'title': 'Task 1',
        'subtitle': 'Complete the report',
        'description': 'we need to complete the reports'
      },
      {
        'title': 'Task 2',
        'subtitle': 'Review PRs',
        'description': 'we need to complete these PRs'
      },
      {
        'title': 'Task 3',
        'subtitle': 'Team meeting at 3 PM',
        'description': 'we have a team meeting at 3PM'
      },
      {
        'title': 'Task 4',
        'subtitle': 'Client call at 5 PM',
        'description': 'we have a client call at 5PM'
      },
    ];

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
            onPressed: () {
              Navigator.pushNamed(context, 'add_tasks');
            },
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
            Expanded(
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final item = data[index];
                  return ViewTaskTile(
                    title: item['title']!,
                    subtitle: item['subtitle']!,
                    description: item['description']!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
