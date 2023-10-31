import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Widget/CustomButton.dart';
import '../../../../Widget/CustomForm.dart';
import '../../../../core/Constant/colors.dart';
import '../../../../core/function/validation.dart';
// import '../../controller/tasks_controller.dart';

// TasksControllerImplement taskController = Get.find();
addTaskDialog(
    {required Key addKey,
    required TextEditingController task,
    required void Function() fun,
    bool isUpdate = false}) {
  Get.defaultDialog(
    title: isUpdate ? 'Edit Task'.tr : 'Add Task'.tr,
    titleStyle: TextStyle(
        fontSize: 20, color: AppColors.indigo, fontWeight: FontWeight.bold),
    middleText: '',
    titlePadding: const EdgeInsets.only(left: 60, right: 60, top: 20),
    content: Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Form(
        key: addKey,
        child: Column(
          children: [
            CustomForm(
                isFilled: true,
                maxLines: 4,
                validator: (value) {
                  //to check valid input
                  return validate(value!, 200, 1);
                },
                hint: 'enter task'.tr,
                textController: task),
            const SizedBox(
              height: 0,
            ),
          ],
        ),
      ),
    ),
    confirm: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: CustomButton(
        height: 45,
        width: double.infinity * 0.5,
        fun: fun,
        text: !isUpdate ? 'Add Task'.tr : 'Update Task'.tr,
      ),
    ),
  );
}
