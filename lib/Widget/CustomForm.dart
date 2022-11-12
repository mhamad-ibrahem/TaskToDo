import 'package:flutter/material.dart';
import 'package:tasks/Constant/Constant.dart';

class CustomForm extends StatelessWidget {
 
  final TextEditingController textController;
  final String hint;
  final String? Function(String?)? validator;
   //constractor of custom textformfield to use it in many screens
  const CustomForm({
    required this.textController,
    required this.hint,
    this.validator,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: textController,
        cursorColor: indigo,
        maxLength: 25,
        maxLines: 1,
        validator: validator,
        decoration: InputDecoration(
          hintText: hint,
          hoverColor: indigo,
        ));
  }
}
