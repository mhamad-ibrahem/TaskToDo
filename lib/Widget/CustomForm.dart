import 'package:flutter/material.dart';
import 'package:tasks/Constant/Constant.dart';

class CustomForm extends StatelessWidget {
  final TextEditingController? textController;
  final String hint;
  final String? Function(String?)? validator;
  final int? maxLines;
  final bool isFilled;
  final void Function(String)? onChanged;

  const CustomForm({
    super.key,
    required this.textController,
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
        cursorColor: indigo,
        maxLines: maxLines ?? 1,
        validator: validator,
        decoration: InputDecoration(
            hintText: hint,
            hoverColor: indigo,
            border: InputBorder.none,
            filled: isFilled,
            fillColor: isFilled ? Colors.grey[100] : Colors.white));
  }
}
