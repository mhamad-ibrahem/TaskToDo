import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:tasks/Constant/Constant.dart';
import 'package:get/get.dart';
import 'package:tasks/Controller/HomeController.dart';
import 'package:tasks/View/TaskBody/TaskScreen.dart';
import 'package:tasks/Widget/CustomButton.dart';
import 'package:tasks/Widget/CustomForm.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  // inject controller
  final HomeControllerImplement homeController =
      Get.put(HomeControllerImplement(), permanent: true);
  final box = Hive.box('myBox');
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //button to add task
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.defaultDialog(
                title: 'Add Task',
                titleStyle: TextStyle(
                    fontSize: 20, color: indigo, fontWeight: FontWeight.bold),
                middleText: '',
                titlePadding:
                    const EdgeInsets.only(left: 60, right: 60, top: 20),
                content: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Form(
                    key: homeController.addKey,
                    child: Column(
                      children: [
                        CustomForm(
                            validator: (value) {
                              //to check valid input
                              return homeController.validate(value!, 25, 2);
                            },
                            hint: 'enter task',
                            textController: homeController.task),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
                confirm: CustomButton(
                  fun: () {
                    homeController.addTask();
                  },
                  text: 'Add Task',
                ),
              );
            },
            backgroundColor: indigo,
            child: Icon(
              Icons.add,
              color: white,
            )),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterFloat,
        backgroundColor: backgroundColor,
        body:
            //body of the screen
            Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
          child: SingleChildScrollView(
            //widget to update change on the screen
            child: GetBuilder<HomeControllerImplement>(
              builder: (homeController) => Column(
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
                            fontSize: 30,
                            color: white,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  //number of task in the screen
                  Text('${homeController.taskList.length} Task',
                      style: TextStyle(
                          fontSize: 15,
                          color: white,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.73,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: white, borderRadius: BorderRadius.circular(12)),
                    child: ListView.builder(
                        itemCount: homeController.taskList.length,
                        itemBuilder: (context, index) => TaskScreen(
                              // task widget with crud operation and check done task
                              onDismissed: (dir) =>
                                  homeController.deleteTasks(index),
                              title: homeController.taskList[index][0],
                              checkTask: homeController.taskList[index][1],
                              checkChange: (val) {
                                homeController.checkCompleteTask(val!, index);
                              },
                              longTap: () {
                                //make the controller take the value of the task to edit it
                                homeController.taskEdit.text =
                                    homeController.taskList[index][0];
                                Get.defaultDialog(
                                  title: 'Edit Task',
                                  titleStyle: TextStyle(
                                      fontSize: 20,
                                      color: indigo,
                                      fontWeight: FontWeight.bold),
                                  middleText: '',
                                  titlePadding: const EdgeInsets.only(
                                      left: 60, right: 60, top: 20),
                                  content: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15, right: 15),
                                    child: Form(
                                      key: homeController.editKey,
                                      child: Column(
                                        children: [
                                          CustomForm(
                                              hint: 'enter task',
                                              validator: (val) {
                                                return homeController.validate(
                                                    val!, 25, 2);
                                              },
                                              textController:
                                                  homeController.taskEdit),
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
                                      if (homeController.editKey.currentState!
                                          .validate()) {
                                        homeController.taskList[index][0] =
                                            homeController.taskEdit.text;
                                        homeController.updateTask();
                                        Get.back();
                                      }
                                    },
                                  ),
                                );
                              },
                            )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
