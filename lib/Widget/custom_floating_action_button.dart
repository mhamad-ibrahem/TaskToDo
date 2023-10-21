import 'package:flutter/material.dart';

import '../core/Constant/colors.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key, this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: onPressed,
        backgroundColor: AppColors.indigo,
        child: const Icon(
          Icons.add,
          color: AppColors.white,
        ));
  }
}
