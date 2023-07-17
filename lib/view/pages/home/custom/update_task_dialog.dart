import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../controller/home_controller.dart';
import '../../../../core/Constant/colors.dart';
import '../../../../core/functions/validate.dart';
import '../../../Widget/CustomButton.dart';
import '../../../Widget/CustomForm.dart';

final HomeControllerImplement homeController = Get.find();
updateTask({required int index}) {
  Get.defaultDialog(
    title: 'Edit Task',
    titleStyle: TextStyle(
        fontSize: 20, color: AppColors.indigo, fontWeight: FontWeight.bold),
    middleText: '',
    titlePadding: const EdgeInsets.only(left: 60, right: 60, top: 20),
    content: Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Form(
        key: homeController.editKey,
        child: Column(
          children: [
            CustomForm(
                hint: 'enter task',
                validator: (val) {
                  return validate(val!, 25, 2);
                },
                textController: homeController.taskEdit),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    ),
    confirm: CustomButton(
      text: 'update',
      fun: () {
        if (homeController.editKey.currentState!.validate()) {
          homeController.taskList[index][0] = homeController.taskEdit.text;
          homeController.updateTask();
          Get.back();
        }
      },
    ),
  );
}
