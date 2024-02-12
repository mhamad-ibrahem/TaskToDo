import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasks/core/language/localization_controller.dart';

import '../core/Constant/colors.dart';

PreferredSizeWidget? customAppBar({
  required String title,
  bool isBack = true,
  Color? color,
  isWithElevation=true,
   isWithSwitch=true,
}) {
  LocalizationController controller = Get.find();
  return AppBar(
    backgroundColor: color ?? AppColors.backgroundColor,
    elevation: isWithElevation?10:0,
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
    actions:isWithSwitch? [
      Row(
        children: [
          const SizedBox(
            width: 20,
          ),
          Text('english'.tr,
              style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500)),
          Switch(
              activeColor: AppColors.indigo,
              value: controller.enableArabicLanguage,
              onChanged: (val) {
                controller.changeLanguage(
                    controller.language == const Locale('ar') ? 'en' : 'ar');
              }),
          Text('arabic'.tr,
              style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500)),
          const SizedBox(
            width: 20,
          ),
        ],
      )
    ]:[],
  );
}
