import 'package:flutter/material.dart';
import 'package:task_manager/theme/colors.dart';

class DescriptionField extends StatelessWidget {
  final TextEditingController? textEditingController;

  const DescriptionField({super.key, this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: TextField(
        controller: textEditingController,
        maxLines: 5,
        decoration: InputDecoration(
          labelText: 'Description',
          labelStyle: TextStyle(color: LightThemeColors.textColor),
          contentPadding: EdgeInsets.only(top: 30.0, left: 16.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
              color: LightThemeColors.primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
