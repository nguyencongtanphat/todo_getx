import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/controller/todo_controller.dart';

import 'package:todo_app/values/colors.dart';
import 'package:todo_app/widgets/floating_action_button.dart';
import 'package:todo_app/widgets/list_tasks.dart';

class TasksScreen extends StatelessWidget {
  TasksScreen({Key? key}) : super(key: key);
  String appTitle = 'Todo App njanjnnjanjanjajnjaanjjnajajaj';
  final todoController = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      floatingActionButton: AppFloatingActionButton(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 30, left: 30, right: 16, bottom: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 30,
                    child: Icon(
                      Icons.list,
                      size: 40,
                    ),
                    backgroundColor: Colors.white,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    appTitle.length > 20
                        ? appTitle.substring(0, 20) + '...'
                        : appTitle,
                    style: const TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Obx(
                    () => Text(
                      '${todoController.todos.length} tasks',
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                      topLeft: Radius.circular(40),
                    ),
                  ),
                  padding: const EdgeInsets.only(top: 40, left: 10, right: 10),
                  child: Obx(
                    () => todoController.todos.length != 0
                        ? ListTask()
                        : const SizedBox(
                            width: double.infinity,
                            child: Text(
                              'You don\'t have any todo. Let\'t try add one! ',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
