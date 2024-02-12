import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/Constant/colors.dart';
import '../../controller/tasks_controller.dart';

class TaskHeader extends StatelessWidget {
  TaskHeader({super.key});
  final TasksControllerImplement taskController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: (){
                Get.back();
              },
              child: const Icon(
                Icons.arrow_back,
                color: AppColors.white,
                size: 33,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              'TaskToDo'.tr,
              style: const TextStyle(
                  fontSize: 30,
                  color: AppColors.white,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        //number of task in the screen
        Text('${taskController.taskList.length} ${"Task".tr}',
            style: const TextStyle(
                fontSize: 15,
                color: AppColors.white,
                fontWeight: FontWeight.bold)),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
