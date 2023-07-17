import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasks/View/pages/home/custom/task_body.dart';
import 'package:tasks/View/pages/home/custom/update_task_dialog.dart';
import '../../../../controller/home_controller.dart';
import '../../../../core/Constant/colors.dart';

class HomeBody extends StatelessWidget {
  HomeBody({super.key});

  final HomeControllerImplement homeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height * 0.73,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(12)),
      child: ListView.builder(
          itemCount: homeController.taskList.length,
          itemBuilder: (context, index) => TaskBody(
                // task widget with crud operation and check done task
                onDismissed: (dir) => homeController.deleteTasks(index),
                title: homeController.taskList[index][0],
                checkTask: homeController.taskList[index][1],
                checkChange: (val) {
                  homeController.checkCompleteTask(val!, index);
                },
                longTap: () {
                  //make the controller take the value of the task to edit it
                  homeController.taskEdit.text =
                      homeController.taskList[index][0];
                  updateTask(index: index);
                },
              )),
    );
  }
}
