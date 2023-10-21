import 'package:flutter/material.dart';

import '../../../../core/Constant/colors.dart';

class TasksBody extends StatelessWidget {
  TasksBody(
      {required this.title,
      this.checkChange,
      required this.checkTask,
      required this.onDelete,
      required this.editFun});

  final Function(bool?)? checkChange;
  final String title;
  final bool checkTask;
  final VoidCallback onDelete;
  final VoidCallback editFun;
  final UniqueKey dismissibleKey = UniqueKey();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: editFun,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(
              left: 20,
              right: 10,
            ),
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      decoration: checkTask == false
                          ? TextDecoration.none
                          : TextDecoration.lineThrough,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Checkbox(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)),
                        activeColor: AppColors.backgroundColor,
                        value: checkTask,
                        onChanged: checkChange),
                    Column(
                      children: [
                        IconButton(
                            onPressed: editFun,
                            icon: Icon(
                              Icons.edit,
                              color: AppColors.indigo,
                            )),
                        IconButton(
                            onPressed: onDelete,
                            icon: Icon(
                              Icons.delete_outlined,
                              color: AppColors.red,
                            )),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(
            thickness: 1.3,
          )
        ],
      ),
    );
  }
}
