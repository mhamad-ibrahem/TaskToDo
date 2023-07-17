import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/home_controller.dart';
import '../../../../core/Constant/colors.dart';
import '../../../../core/functions/validate.dart';
import '../../../Widget/CustomButton.dart';
import '../../../Widget/CustomForm.dart';

final HomeControllerImplement homeController = Get.find();
addTaskDialog() {
  Get.defaultDialog(
    title: 'Add Task',
    titleStyle: TextStyle(
        fontSize: 20, color: AppColors.indigo, fontWeight: FontWeight.bold),
    middleText: '',
    titlePadding: const EdgeInsets.only(left: 60, right: 60, top: 20),
    content: Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Form(
        key: homeController.addKey,
        child: Column(
          children: [
            CustomForm(
                validator: (value) {
                  //to check valid input
                  return validate(value!, 25, 2);
                },
                hint: 'enter task',
                textController: homeController.task),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    ),
    confirm: CustomButton(
      fun: () {
        homeController.addTask();
      },
      text: 'Add Task',
    ),
  );
}
