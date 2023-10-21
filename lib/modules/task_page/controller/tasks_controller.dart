import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tasks/modules/main_page/controller/main_page_controller.dart';

class TasksControllerImplement extends GetxController {
  final box = Hive.box('myBox');
  TextEditingController task = TextEditingController();
  TextEditingController taskEdit = TextEditingController();
  GlobalKey<FormState> addKey = GlobalKey(); //key for add task form
  GlobalKey<FormState> editKey = GlobalKey(); //key for Edit task Form
  Map<dynamic, dynamic> note = Get.arguments['Note'];
  List taskList = [];
  MainPageController mainPageController = Get.find();
  int numberNotDone = 0;
  String? groupId;
  // to check if task complete

  checkCompleteTask(bool val, int index) {
    taskList[index][1] = !taskList[index][1];
    numberNotDone = 0;
    taskList.forEach((element) {
      if (element[1] == false) {
        numberNotDone++;
      }
    });
    note['numberOfTask'] = numberNotDone;
    mainPageController.update();
    log("Un completes task Number is :${note['numberOfTask']}");
    updateTask();
    update();
  }

  initialTask() {
    taskList = [];
  }

  getTasks() async {
    numberNotDone = 0;
    taskList = await box.get('tasks$groupId');
    log('tasks number is: ${taskList.length}');
    note['numberOfTask'] = 0;
    note['numberOfTask'] = taskList.length;
    taskList.forEach((element) {
      if (element[1] == false) {
        numberNotDone++;
      }
    });
    note['numberOfTaskRemains'] = 0;
    note['numberOfTaskRemains'] = numberNotDone;
    mainPageController.update();
    update();
  }

  updateTask() {
    log("update Note id is : $groupId");
    int index = mainPageController.notes
        .indexWhere((element) => element['id'] == groupId);
    numberNotDone = 0;
    box.put('tasks$groupId', taskList);
    log('tasks number is: ${taskList.length}');
    mainPageController.notes[index]['numberOfTask'] = 0;
    mainPageController.notes[index]['tasks'] = taskList;
    mainPageController.notes[index]['numberOfTask'] = taskList.length;
    taskList.forEach((element) {
      if (element[1] == false) {
        numberNotDone++;
      }
    });
    mainPageController.notes[index]['numberOfTaskRemains'] = 0;
    mainPageController.notes[index]['numberOfTaskRemains'] = numberNotDone;
    mainPageController.update();
    update();

    box.put('notes', mainPageController.notes);
    update();
  }

  addTask() {
    log("add Note id is : $groupId");
    if (addKey.currentState!.validate()) {
      taskList.add([task.text, false, groupId]);
      task.clear();
      updateTask();
      Get.back();
      update();
    }
  }

  deleteTasks(int index) {
    taskList.removeAt(index);
    updateTask();
    Get.back();
    update();
  }

  @override
  void onInit() async {
    groupId = note['id'];
    log("initial Note id is : $groupId");
    if (box.get('tasks$groupId') == null) {
      initialTask();
    } else {
      await getTasks();
    }
    super.onInit();
  }
}
