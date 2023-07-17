import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/home_controller.dart';
import '../../../../core/Constant/colors.dart';

class HomeHeader extends StatelessWidget {
  HomeHeader({super.key});
  final HomeControllerImplement homeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return ListView(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Icon(
              Icons.playlist_add_check_rounded,
              color: AppColors.white,
              size: 33,
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              'TaskToDo',
              style: TextStyle(
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
        Text('${homeController.taskList.length} Task',
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
