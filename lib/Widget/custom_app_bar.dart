import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/Constant/colors.dart';

PreferredSizeWidget? customAppBar({
  required String title,
  bool isBack = true,
  Color? color,
}) {
  return AppBar(
    backgroundColor: color ?? AppColors.backgroundColor,
    centerTitle: true,
    leading: isBack
        ? IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: AppColors.indigo,
            ))
        : null,
    title: Text(
      title,
      style: const TextStyle(
          color: AppColors.white, fontSize: 20, fontWeight: FontWeight.w500),
    ),
  );
}
