import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Constant/Constant.dart';
import '../../../../Widget/CustomButton.dart';
// import '../../controller/tasks_controller.dart';

// TasksControllerImplement taskController = Get.find();
deleteTskDialog({
  required void Function() fun,
}) {
  Get.defaultDialog(
    title: 'Delete Task',
    titleStyle:
        TextStyle(fontSize: 20, color: indigo, fontWeight: FontWeight.bold),
    middleText: '',
    titlePadding: const EdgeInsets.only(left: 60, right: 60, top: 20),
    content: Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Are you sure you want to delete this task ?!',
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  height: 45,
                  width: double.infinity * 0.5,
                  fun: () {
                    Get.back();
                  },
                  text: 'Cancel',
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: CustomButton(
                  height: 45,
                  width: double.infinity * 0.5,
                  fun: fun,
                  text: 'Delete',
                ),
              ),
            ],
          )
        ],
      ),
    ),
  );
}
