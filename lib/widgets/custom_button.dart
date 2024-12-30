import 'package:flutter/material.dart';
import 'package:task_manager/theme/colors.dart';

class CustomButton extends StatelessWidget {
  final Function()? onPressed;
  final String buttonText;

  const CustomButton({super.key, this.onPressed, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: LightThemeColors.primaryColor,
        ),
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
