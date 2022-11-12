import 'package:flutter/material.dart';
import 'package:tasks/Constant/Constant.dart';

class CustomButton extends StatelessWidget {
  //constractor to use custom button in many screens
  CustomButton({super.key, required this.fun, required this.text});
  final VoidCallback fun;
  final String text;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: fun,
      color: indigo,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      height: 40,
      padding: const EdgeInsets.only(left: 60, right: 60, top: 15, bottom: 15),
      child: Text(
        text,
        style:
            TextStyle(fontSize: 13, color: white, fontWeight: FontWeight.w500),
      ),
    );
  }
}
