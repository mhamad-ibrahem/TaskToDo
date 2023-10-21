import 'package:flutter/material.dart';
import 'package:tasks/Constant/Constant.dart';

class CustomButton extends StatelessWidget {
  //constractor to use custom button in many screens
  CustomButton(
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
      color: indigo,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      height: height ?? 40,
      minWidth: width ?? 50,
      child: Text(
        text,
        style:
            TextStyle(fontSize: 13, color: white, fontWeight: FontWeight.w500),
      ),
    );
  }
}
