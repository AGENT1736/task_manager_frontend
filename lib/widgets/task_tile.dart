import 'package:flutter/material.dart';
import 'package:task_manager/theme/colors.dart';

class ViewTaskTile extends StatefulWidget {
  final String title;
  final String subtitle;
  final String description;
  const ViewTaskTile(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.description});

  @override
  State<ViewTaskTile> createState() => _ViewTaskTileState();
}

class _ViewTaskTileState extends State<ViewTaskTile> {
  bool isChecked = false;

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
            widget.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(widget.subtitle),
          trailing: Transform.scale(
            scale: 1.15,
            child: Checkbox(
              activeColor: LightThemeColors.primaryColor,
              side: BorderSide(
                width: 1.5,
              ),
              value: isChecked,
              onChanged: (value) {
                setState(() {
                  isChecked = !isChecked;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
