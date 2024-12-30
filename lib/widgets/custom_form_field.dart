import 'package:flutter/material.dart';

import '../theme/colors.dart';

class CustomFormField extends StatelessWidget {
  final String labelText;
  final String? hintText;
  final TextEditingController? textEditingController;

  const CustomFormField({
    super.key,
    required this.labelText,
    this.hintText,
    this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: TextFormField(
        controller: textEditingController,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color: LightThemeColors.textColor),
          hintText: hintText,
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
