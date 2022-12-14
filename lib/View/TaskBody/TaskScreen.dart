import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasks/Constant/Constant.dart';
import 'package:tasks/Controller/HomeController.dart';
import 'package:tasks/View/TaskBody/DissmissableBackground.dart';

class TaskScreen extends StatelessWidget {
  //constractor of this class to use it in listView
  TaskScreen(
      {required this.title,
      this.checkChange,
      required this.checkTask,
      this.onDismissed,
      required this.longTap});
  //class parmeter
  final Function(bool?)? checkChange;
  final String title;
  final bool checkTask;
  final Function(DismissDirection)? onDismissed;
  final VoidCallback longTap;
  UniqueKey dismissibleKey = UniqueKey();
  @override
  Widget build(BuildContext context) {
    //body of the screen
    return GestureDetector(
      //function to edit task
      onLongPress: longTap,
      child: Dismissible(
        //to delete the task by swaping it
        direction: DismissDirection.horizontal,
        key: dismissibleKey,
        onDismissed: onDismissed,
        background: const DismissableBackGround(),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 20, right: 10, top: 20),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.06,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      //to make a line through the text if the check value is true and task is done
                      decoration: checkTask == false
                          ? TextDecoration.none
                          : TextDecoration.lineThrough,
                    ),
                  ),
                  Checkbox(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                      activeColor: backgroundColor,
                      value: checkTask,
                      onChanged: checkChange),
                ],
              ),
            ),
            const Divider(
              thickness: 1.3,
            )
          ],
        ),
      ),
    );
  }
}
