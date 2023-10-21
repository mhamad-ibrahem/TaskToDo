import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Constant/Constant.dart';
import '../../../../Widget/CustomButton.dart';
import '../../../../Widget/CustomForm.dart';
import '../../../../core/function/validation.dart';
// import '../../controller/tasks_controller.dart';

// TasksControllerImplement taskController = Get.find();
addTaskDialog(
    {required Key addKey,
    required TextEditingController task,
    required void Function() fun,
    bool isUpdate = false}) {
  Get.defaultDialog(
    title: isUpdate ? 'Edit Task' : 'Add Task',
    titleStyle:
        TextStyle(fontSize: 20, color: indigo, fontWeight: FontWeight.bold),
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
                hint: 'enter task',
                textController: task),
            const SizedBox(
              height: 0,
            ),
          ],
        ),
      ),
    ),
    confirm: CustomButton(
      height: 45,
      width: double.infinity * 0.5,
      fun: fun,
      text: !isUpdate ? 'Add Task' : 'Update Task',
    ),
  );
}
