import 'package:flutter/material.dart';
import 'package:task_manager/theme/colors.dart';
import 'package:task_manager/widgets/custom_button.dart';
import 'package:task_manager/widgets/custom_form_field.dart';
import 'package:task_manager/widgets/description_field.dart';

class AddTasks extends StatelessWidget {
  const AddTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightThemeColors.backgroundColor,
      bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 50.0),
          child: CustomButton(
            buttonText: "Confirm Task",
            onPressed: () {},
          )),
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
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: CustomFormField(
                labelText: "Task Subtitle: ",
                hintText: "Enter your task subtitle here!",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: DescriptionField(),
            ),
          ],
        ),
      ),
    );
  }
}
