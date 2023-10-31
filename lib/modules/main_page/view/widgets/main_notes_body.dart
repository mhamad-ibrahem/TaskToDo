import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/Constant/colors.dart';

class MainNotesBody extends StatelessWidget {
  const MainNotesBody(
      {super.key,
      required this.day,
      required this.date,
      required this.number,
      this.delete,
      this.onTap,
      required this.notDoneNumber});
  final String day;
  final String date;
  final int number;
  final int notDoneNumber;
  final void Function()? delete;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${'Day'.tr} : $day",
                  style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                IconButton(
                    onPressed: delete,
                    icon: const Icon(
                      Icons.delete,
                      color: AppColors.white,
                    ))
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "$date",
                  style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "${'Number of task:'.tr}$number",
                  style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              "${'Number of task not done:'.tr}$notDoneNumber",
              style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
