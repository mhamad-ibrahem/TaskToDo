import 'package:flutter/material.dart';
import 'package:tasks/Constant/Constant.dart';
import 'package:tasks/Widget/CustomForm.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({super.key, this.textController, this.onChanged});
  final TextEditingController? textController;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(20),
      elevation: 4,
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          decoration: BoxDecoration(
              color: white, borderRadius: BorderRadius.circular(20)),
          child: CustomForm(
              onChanged: onChanged,
              textController: textController,
              hint: 'Search by date')),
    );
  }
}
