import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Constant/Constant.dart';

PreferredSizeWidget? customAppBar({
  required String title,
  bool isBack = true,
  Color? color,
}) {
  return AppBar(
    backgroundColor: color ?? backgroundColor,
    centerTitle: true,
    leading: isBack
        ? IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: indigo,
            ))
        : null,
    title: Text(
      title,
      style: TextStyle(color: white, fontSize: 20, fontWeight: FontWeight.w500),
    ),
  );
}
