import 'package:flutter/material.dart';
import 'package:tasks/core/Constant/colors.dart';

class CustomForm extends StatelessWidget {
  final int? maxLines;
  final bool isFilled;
  final void Function(String)? onChanged;

  final TextEditingController? textController;
  final String hint;
  final String? Function(String?)? validator;

  const CustomForm({
    super.key,
    this.textController,
    required this.hint,
    this.validator,
    this.maxLines,
    this.isFilled = false,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      controller: textController,
      cursorColor: AppColors.indigo,
      maxLines: maxLines ?? 1,
      validator: validator,
      decoration: InputDecoration(
          hintText: hint,
          hoverColor: AppColors.indigo,
          border: InputBorder.none,
          filled: isFilled,
          fillColor: isFilled ? Colors.grey[100] : Colors.white),
    );
  }
}
