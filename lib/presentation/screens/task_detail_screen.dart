import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/controllers/task_detail_controller.dart';

class TaskDetailView extends GetView<TaskDetailController> {
  const TaskDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final task = controller.task;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Task Detail", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              task.title,
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              task.description,
              style: TextStyle(fontSize: 18, color: Colors.black54),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text("Completed:", style: TextStyle(fontSize: 18)),
                Switch(
                  value: task.isCompleted,
                  onChanged: (value) => controller.toggleComplete(),
                  activeColor: Colors.blueAccent,
                ),
              ],
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text("Delete Task", style: TextStyle(fontSize: 18)),
                onPressed: () => controller.deleteTask(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
