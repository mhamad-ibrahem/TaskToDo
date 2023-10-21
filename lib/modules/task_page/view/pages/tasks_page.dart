import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:tasks/Constant/Constant.dart';
import 'package:get/get.dart';
import '../../controller/tasks_controller.dart';
import '../widgets/add_task_dialog.dart';
import '../widgets/delete_dialog.dart';
import '../widgets/task_body.dart';
import '../widgets/task_header.dart';

class TasksPage extends StatelessWidget {
  TasksPage({super.key});
  // inject controller
  final TasksControllerImplement taskController =
      Get.put(TasksControllerImplement());
  final box = Hive.box('myBox');
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //button to add task
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              addTaskDialog(
                  addKey: taskController.addKey,
                  task: taskController.task,
                  fun: () {
                    taskController.addTask();
                  });
            },
            backgroundColor: indigo,
            child: Icon(
              Icons.add,
              color: white,
            )),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterFloat,
        backgroundColor: backgroundColor,
        body: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
          child: SingleChildScrollView(
            child: GetBuilder<TasksControllerImplement>(
              builder: (tasksController) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TaskHeader(),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.73,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: white, borderRadius: BorderRadius.circular(12)),
                    child: ListView.builder(
                        itemCount: tasksController.taskList.length,
                        itemBuilder: (context, index) => TasksBody(
                              // task widget with crud operation and check done task
                              onDelete: () {
                                deleteTskDialog(fun: () {
                                  tasksController.deleteTasks(index);
                                });
                              },
                              title: tasksController.taskList[index][0],
                              checkTask: tasksController.taskList[index][1],
                              checkChange: (val) {
                                tasksController.checkCompleteTask(val!, index);
                              },
                              editFun: () {
                                //make the controller take the value of the task to edit it
                                tasksController.taskEdit.text =
                                    tasksController.taskList[index][0];
                                addTaskDialog(
                                    addKey: tasksController.editKey,
                                    task: tasksController.taskEdit,
                                    fun: () {
                                      if (tasksController.editKey.currentState!
                                          .validate()) {
                                        tasksController.taskList[index][0] =
                                            tasksController.taskEdit.text;
                                        tasksController.updateTask();
                                        Get.back();
                                      }
                                    },
                                    isUpdate: true);
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
