import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Widget/CustomButton.dart';
import '../../../../core/Constant/colors.dart';
import '../../controller/main_page_controller.dart';

deleteDialog(int index) {
  final MainPageController controller = Get.find();
  Get.defaultDialog(
      title: 'Are you sure you want delete this ?',
      titleStyle: TextStyle(
          fontSize: 20, color: AppColors.indigo, fontWeight: FontWeight.bold),
      middleText: '',
      titlePadding: const EdgeInsets.only(left: 60, right: 60, top: 20),
      content: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: CustomButton(
                    height: 50,
                    fun: () {
                      Get.back();
                    },
                    text: 'Cancel',
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: CustomButton(
                    height: 50,
                    fun: () {
                      controller.deleteNote(index);
                    },
                    text: 'Yes',
                  ),
                ),
              ),
            ],
          ),
        ],
      ));
}
