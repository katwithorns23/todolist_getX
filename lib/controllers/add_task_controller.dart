import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/controllers/home_controller.dart';
import 'package:todolist/data/models/task_model.dart';

class AddTaskController extends GetxController {
  final titleController = TextEditingController();
  final descController = TextEditingController();

  void saveTask() {
    if (titleController.text.trim().isEmpty) {
      Get.snackbar("Error", "Title cannot be empty");
      return;
    }

    final newTask = TaskModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: titleController.text,
      description: descController.text,
    );

    Get.find<HomeController>().addTask(newTask);
    Get.back();
  }
}
