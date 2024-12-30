import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:task_manager/theme/colors.dart';
import 'package:task_manager/widgets/custom_button.dart';
import 'package:task_manager/widgets/custom_form_field.dart';
import 'package:task_manager/widgets/description_field.dart';

class AddTasks extends StatelessWidget {
  const AddTasks({super.key});

  // Function to send task data to the Go backend
  Future<void> sendTaskToBackend(
      String title, String subtitle, String description) async {
    final url = Uri.parse(
        'http://10.0.2.2:8080/tasks'); // Update with your backend URL if necessary

    final headers = {
      'Content-Type': 'application/json',
    };

    final body = json.encode({
      'title': title,
      'subtitle': subtitle,
      'description': description,
    });

    try {
      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 201) {
        print('Task added successfully');
      } else {
        print('Failed to add task!');
      }
    } catch (e) {
      print('Error sending task to backend!');
    }
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController subtitleController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();

    return Scaffold(
      backgroundColor: LightThemeColors.backgroundColor,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 25.0),
        child: CustomButton(
          buttonText: "Confirm Task",
          onPressed: () {
            final title = titleController.text;
            final subtitle = subtitleController.text;
            final description = descriptionController.text;

            // Send task data to the backend
            sendTaskToBackend(title, subtitle, description);
            // Navigator.pop(context);
          },
        ),
      ),
      appBar: AppBar(
        backgroundColor: LightThemeColors.appBarColor,
        title: Text(
          "Add a task",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w900,
            color: LightThemeColors.textColor,
          ),
        ),
        centerTitle: true,
      ),
      body: Form(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: CustomFormField(
                labelText: "Task Title: ",
                hintText: "Enter your task title here!",
                textEditingController: titleController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: CustomFormField(
                labelText: "Task Subtitle: ",
                hintText: "Enter your task subtitle here!",
                textEditingController: subtitleController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: DescriptionField(
                textEditingController: descriptionController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
