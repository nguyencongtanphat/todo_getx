import 'package:flutter/material.dart';
import 'package:todo_app/screens/add_task_screen.dart';
import 'package:todo_app/values/colors.dart';

class AppFloatingActionButton extends StatelessWidget {
  AppFloatingActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet<void>(
          context: context,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(40),
              topLeft: Radius.circular(40),
            ),
          ),
          builder: (BuildContext context) {
            return AddTaskScreen();
          },
        );
      },
      child: const Icon(
        Icons.add,
      ),
    );
  }
}
