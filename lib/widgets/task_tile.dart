import 'package:flutter/material.dart';
import 'package:task_manager/theme/colors.dart';

class ViewTaskTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String description;
  const ViewTaskTile(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.description});

  @override
  Widget build(BuildContext context) {
    //final String description;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Card(
        color: Colors.white,
        child: ListTile(
          onTap: () {
            //TODO: show bottomsheet to view the status of the task!
          },
          title: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(subtitle),
          trailing: Checkbox(
            activeColor: LightThemeColors.primaryColor,
            value: false,
            onChanged: (value) {},
          ),
        ),
      ),
    );
  }
}
