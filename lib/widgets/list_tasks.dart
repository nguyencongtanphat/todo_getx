import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/controller/todo_controller.dart';
import 'package:get/get.dart';
import 'package:todo_app/widgets/task.dart';

class ListTask extends StatelessWidget {
  ListTask({
    Key? key,
  }) : super(key: key);

  final TodoController todoController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Task(index: index);
          },
          itemCount: todoController.todos.length,
        ));
  }
}
