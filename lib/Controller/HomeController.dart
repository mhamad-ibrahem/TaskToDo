import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tasks/View/Home/HomeScreen.dart';

abstract class HomeController extends GetxController {
  checkCompleteTask(bool val, int index);  // to check if task complete
  initialTask();  // function for get data for the first time run the app ever
  getTasks();  // function for get data when run the app
  updateTask();  //update task in every change
  addTask();  // add task for listTask
  validate(String value, int max,
      int min);  //validate function to check if the input are valid
  deleteTasks(int index);  //delete task form the list
}

//implement class of home controller class
class HomeControllerImplement extends HomeController {
  final box = Hive.box('myBox');
  TextEditingController task = TextEditingController();
  TextEditingController taskEdit = TextEditingController();
  GlobalKey<FormState> addKey = GlobalKey(); //key for add task form
  GlobalKey<FormState> editKey = GlobalKey(); //key for Edit task Form
  List taskList = [];

  // to check if task complete

  @override
  checkCompleteTask(bool val, int index) {
    taskList[index][1] = !taskList[index][1];
    updateTask();
    update();
  }

  // function for get data for the first time run the app ever

  @override
  initialTask() {
    taskList = [];
  }

  // function for get data when run the app

  @override
  getTasks() {
    taskList = box.get('tasks');
  }

//update task in every change
  @override
  updateTask() {
    box.put('tasks', taskList);
    update();
  }

  // add task for listTask
  @override
  addTask() {
    if (addKey.currentState!.validate()) {
      taskList.add([task.text, false]);
      //to delete the text from the form when we open it again
      task.clear();
      updateTask();
      Get.back();
      update();
    }
  }

  //delete task form the list

  @override
  deleteTasks(int index) {
    //remove item from list
    taskList.removeAt(index);
    updateTask();
    update();
  }

  //validate function to check if the input are valid

  validate(String value, int max, int min) {
    if (value.isEmpty) {
      return 'cant be empty ';
    }
    if (value.length > max) {
      return 'you Cant enter more than $max letter';
    }
    if (value.length < min) {
      return 'you cant enter less than $min letter';
    }
  }

//initial app after opening it

  @override
  void onInit() {
    if (box.get('tasks') == null) {
      // if it is the first time ever openeing this app call this function that return empty task list
      initialTask();
    } else {
      //else get tasks that the user add it
      getTasks();
    }
    super.onInit();
  }
}
