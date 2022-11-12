import 'package:flutter/material.dart';
import 'package:tasks/Constant/Constant.dart';

class DismissableBackGround extends StatelessWidget {
  const DismissableBackGround({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.06,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Icon(
            Icons.delete,
            color: red,
            size: 30,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            'Delete ',
            style: TextStyle(
                fontSize: 17, color: red, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            width: 40,
          ),
        ],
      ),
    );
  }
}
