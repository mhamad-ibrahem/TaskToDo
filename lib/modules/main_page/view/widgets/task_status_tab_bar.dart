import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasks/modules/main_page/controller/main_page_controller.dart';

import '../../../../core/Constant/colors.dart';

class TaskStatusBar extends StatelessWidget {
  const TaskStatusBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MainPageController>();
    return DefaultTabController(
      length: 4,
      child: TabBar(
        isScrollable: true,
        onTap: (index) {
          controller.selectedIndex = index;
          if (index == 1) {
            List<dynamic> notesList = controller.notes
                .where((element) => (element['numberOfTask'] ==
                        element['numberOfTaskRemains'] ||
                    element['numberOfTask'] == 0))
                .toList();
            controller.noteList = notesList;
            controller.noteList.sort(
              (a, b) => b['dateValue'].compareTo(a['dateValue']),
            );
          }
          if (index == 2) {
            List<dynamic> notesList = controller.notes
                .where((element) => (element['numberOfTask'] !=
                        element['numberOfTaskRemains'] &&
                    element['numberOfTaskRemains'] != 0))
                .toList();
            controller.noteList = notesList;
            controller.noteList.sort(
              (a, b) => b['dateValue'].compareTo(a['dateValue']),
            );
          }
          if (index == 3) {
            List<dynamic> notesList = controller.notes
                .where((element) => (element['numberOfTask'] != 0 &&
                    element['numberOfTaskRemains'] == 0))
                .toList();
            controller.noteList = notesList;
            controller.noteList.sort(
              (a, b) => b['dateValue'].compareTo(a['dateValue']),
            );
          }
          if (index == 0) {
            controller.notes.sort(
              (a, b) => b['dateValue'].compareTo(a['dateValue']),
            );
          }
          controller.selectedSorted = controller.sortedList[0];
          controller.search.clear();
          controller.update();
        },
        indicatorColor: AppColors.indigo,
        labelStyle: Theme.of(context).textTheme.displayMedium?.copyWith(
            color: Colors.black, fontWeight: FontWeight.w500, fontSize: 15),
        unselectedLabelStyle: Theme.of(context)
            .textTheme
            .displayMedium
            ?.copyWith(
                color: AppColors.grey,
                fontWeight: FontWeight.w500,
                fontSize: 15),
        labelColor: Colors.black,
        unselectedLabelColor: AppColors.grey,
        indicatorWeight: 4,
        tabs: [
          Tab(
              icon: FittedBox(
            child: Text(
              "All".tr,
            ),
          )),
          Tab(
              icon: FittedBox(
            child: Text(
              "Pending".tr,
            ),
          )),
          Tab(
              icon: FittedBox(
            child: Text(
              "Processing".tr,
            ),
          )),
          Tab(
              icon: FittedBox(
            child: Text(
              "Done".tr,
            ),
          )),
        ],
      ),
    );
  }
}
