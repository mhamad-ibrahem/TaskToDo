import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/Constant/colors.dart';
import 'CustomForm.dart';

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
              color: AppColors.white, borderRadius: BorderRadius.circular(20)),
          child: CustomForm(
              onChanged: onChanged,
              textController: textController,
              hint: 'Search by date'.tr)),
    );
  }
}
