import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:tasks/View/pages/home/custom/home_header.dart';
import 'package:tasks/core/Constant/colors.dart';
import 'package:get/get.dart';
import '../../../../controller/home_controller.dart';
import 'custom/add_task_dialog.dart';
import 'custom/home_body.dart';

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
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              addTaskDialog();
            },
            backgroundColor: AppColors.indigo,
            child: const Icon(
              Icons.add,
            )),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterFloat,
        backgroundColor: AppColors.backgroundColor,
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: GetBuilder<HomeControllerImplement>(
            builder: (homeController) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 4, child: HomeHeader()),
                Expanded(flex: 22, child: HomeBody()),
                const Expanded(
                  child: SizedBox(
                    height: 25,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
