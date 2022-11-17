import 'package:flutter/material.dart';
import 'package:sqllite_example/ui/theme/app_colors.dart';

class NoteControlTextField extends StatelessWidget {
  final String textFieldTitle;
  final int maxLines;
  final TextEditingController controller;
  const NoteControlTextField({
    Key? key,
    required this.textFieldTitle,
    required this.maxLines,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      minLines: 1,
      maxLines: maxLines,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        hintText: textFieldTitle,
        labelText: textFieldTitle,
        hintStyle: const TextStyle(
          color: AppColors.primaryDarkColor,
          fontSize: 16,
          height: 1.5,
        ),
        labelStyle: const TextStyle(
          color: AppColors.secondaryDarkColor,
          fontSize: 12,
          height: 1.33,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(
            width: 1,
            color: AppColors.greyColor,
          ),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: AppColors.greyColor,
          ),
        ),
      ),
    );
  }
}
