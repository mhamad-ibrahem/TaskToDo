import 'package:flutter/material.dart';
import 'package:tasks/core/Constant/colors.dart';

class DismissableBackGround extends StatelessWidget {
  const DismissableBackGround({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.06,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Icon(
            Icons.delete,
            color: AppColors.red,
            size: 30,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            'Delete ',
            style: TextStyle(
                fontSize: 17,
                color: AppColors.red,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: 40,
          ),
        ],
      ),
    );
  }
}
