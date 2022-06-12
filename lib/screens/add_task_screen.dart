import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/controller/todo_controller.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/values/colors.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({
    Key? key,
  }) : super(key: key);

  final TodoController todoController = Get.find();

  @override
  Widget build(BuildContext context) {
    String newTask = '';
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(40),
          topLeft: Radius.circular(40),
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 8,
          ),
          TextField(
            autofocus: true,
            onChanged: (value) {
              newTask = value;
            },
            style: const TextStyle(
              fontSize: 25,
            ),
          ),
          TextButton(
            onPressed: () {
              if (newTask != '') {
                todoController.todos.add(Todo(text: newTask));
              }
              Navigator.pop(context);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: AppColors.primaryColor,
              ),
              margin: const EdgeInsets.only(top: 16),
              padding: const EdgeInsets.all(16),
              child: const Text(
                'Add Todo',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
