import 'package:flutter/material.dart';

import '../Constant/Constant.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key, this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: onPressed,
        backgroundColor: indigo,
        child: Icon(
          Icons.add,
          color: white,
        ));
  }
}
