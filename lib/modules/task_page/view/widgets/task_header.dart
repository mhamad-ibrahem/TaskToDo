import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Constant/Constant.dart';
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
            Icon(
              Icons.playlist_add_check_rounded,
              color: white,
              size: 33,
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              'TaskToDo',
              style: TextStyle(
                  fontSize: 30, color: white, fontWeight: FontWeight.bold),
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        //number of task in the screen
        Text('${taskController.taskList.length} Task',
            style: TextStyle(
                fontSize: 15, color: white, fontWeight: FontWeight.bold)),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
