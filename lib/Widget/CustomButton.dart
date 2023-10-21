import 'package:flutter/material.dart';
import 'package:tasks/core/Constant/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.fun,
      required this.text,
      this.width,
      this.height});
  final VoidCallback fun;
  final String text;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: fun,
      color: AppColors.indigo,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      height: height ?? 40,
      minWidth: width ?? 50,
      child: Text(
        text,
        style: const TextStyle(
            fontSize: 13, color: AppColors.white, fontWeight: FontWeight.w500),
      ),
    );
  }
}
