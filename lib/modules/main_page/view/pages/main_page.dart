import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasks/modules/main_page/controller/main_page_controller.dart';
import '../../../../Widget/custom_app_bar.dart';
import '../../../../Widget/custom_floating_action_button.dart';
import '../../../../Widget/custom_search_form.dart';
import '../../../../core/Constant/colors.dart';
import '../../../../core/functions/day_view.dart';
import '../../../task_page/view/pages/tasks_page.dart';
import '../widgets/delete_dialog.dart';
import '../widgets/main_notes_body.dart';
import '../widgets/task_status_tab_bar.dart';
import '../widgets/time_filter.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});
  final MainPageController controller = Get.put(MainPageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'Main Page'.tr, isBack: false),
      floatingActionButton: CustomFloatingActionButton(onPressed: () {
        controller.chooseDate(showDatePicker(
          context: context,
          initialDate: controller.dateTime,
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(const Duration(days: 365 * 10)),
          builder: (context, child) {
            return Theme(
                data: ThemeData.light().copyWith(
                    cardColor: AppColors.white,
                    colorScheme: ColorScheme.light(
                      primary: AppColors.indigo, // header background color
                    ),
                    textButtonTheme: TextButtonThemeData(
                      style: TextButton.styleFrom(
                        foregroundColor: AppColors.indigo, // button text color
                      ),
                    ),
                    inputDecorationTheme: const InputDecorationTheme(
                        labelStyle: TextStyle(color: Colors.black))),
                child: child!);
          },
        ));
      }),
      body: GetBuilder<MainPageController>(
        builder: (controller) => SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              CustomSearchField(
                onChanged: (val) {
                  controller.searching(val);
                },
                textController: controller.search,
              ),
              const SizedBox(
                height: 20,
              ),
              TimeFilter(
                filterBy: controller.selectedSorted,
                onChanged: (value) {
                  controller.changeSorted(value);
                },
                sortList: controller.sortedList,
              ),
              const SizedBox(
                height: 20,
              ),
              const TaskStatusBar(),
              const SizedBox(
                height: 20,
              ),
              ListView.builder(
                itemCount: controller.search.text.isNotEmpty
                    ? controller.searchList.length
                    : controller.selectedIndex == 0
                        ? controller.notes.length
                        : controller.noteList.length,
                shrinkWrap: true,
                // reverse: controller.isReversed,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => MainNotesBody(
                  onTap: () {
                    Get.to(() => TasksPage(), arguments: {
                      "Note": controller.search.text.isNotEmpty
                          ? controller.searchList[index]
                          : controller.selectedIndex == 0
                              ? controller.notes[index]
                              : controller.noteList[index]
                    });
                  },
                  date: controller.search.text.isNotEmpty
                      ? controller.searchList[index]['date']
                      : controller.selectedIndex == 0
                          ? controller.notes[index]['date']
                          : controller.noteList[index]['date'],
                  day: controller.search.text.isNotEmpty
                      ? viewDay(controller.searchList[index]['day'])
                      : controller.selectedIndex == 0
                          ? viewDay(controller.notes[index]['day'])
                          : viewDay(controller.noteList[index]['day']),
                  number: controller.search.text.isNotEmpty
                      ? controller.searchList[index]['numberOfTask']
                      : controller.selectedIndex == 0
                          ? controller.notes[index]['numberOfTask']
                          : controller.noteList[index]['numberOfTask'],
                  notDoneNumber: controller.search.text.isNotEmpty
                      ? controller.searchList[index]['numberOfTaskRemains']
                      : controller.selectedIndex == 0
                          ? controller.notes[index]['numberOfTaskRemains']
                          : controller.noteList[index]['numberOfTaskRemains'],
                  delete: () {
                    deleteDialog(index);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
