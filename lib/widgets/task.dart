import 'package:flutter/material.dart';
import 'package:todo_app/controller/todo_controller.dart';
import 'package:get/get.dart';
import 'package:todo_app/screens/edit_task_screen.dart';
import 'package:todo_app/values/colors.dart';

class Task extends StatelessWidget {
  int index;
  final TodoController todoController = Get.find();

  Task({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => ListTile(
          onLongPress: () {
            todoController.todos.removeAt(index);
          },
          leading: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 16,
                backgroundColor: AppColors.primaryColor,
                child: Text(
                  (index + 1).toString(),
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
              Checkbox(
                value: todoController.todos[index].isCompleted,
                onChanged: (newValue) {
                  // todoController.todos[index].isCompleted = newValue!;
                  var change = todoController.todos[index];
                  change.isCompleted = newValue!;
                  todoController.todos[index] = change;
                },
              ),
            ],
          ),
          title: Text(
            todoController.todos[index].text,
            style: TextStyle(
              fontSize: 20,
              decoration: todoController.todos[index].isCompleted == true
                  ? TextDecoration.lineThrough
                  : null,
              color: todoController.todos[index].isCompleted == true
                  ? Colors.redAccent
                  : Colors.black87,
            ),
          ),
          trailing: Icon(Icons.chevron_right),
          onTap: () {
            Get.to(EditTaskScreen(
              index: index,
            ));
          },
        ));
  }
}
