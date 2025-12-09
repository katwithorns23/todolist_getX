import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "My Tasks",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        child: Icon(Icons.add, size: 28),
        onPressed: () => Get.toNamed('/add-task'),
      ),
      body: Obx(() {
        if (controller.tasks.isEmpty) {
          return Center(
            child: Text(
              "No tasks yet...",
              style: TextStyle(fontSize: 18, color: Colors.black54),
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: controller.tasks.length,
          itemBuilder: (context, index) {
            final task = controller.tasks[index];
            return GestureDetector(
              onTap: () => Get.toNamed('/task-detail', arguments: index),
              child: Container(
                margin: EdgeInsets.only(bottom: 15),
                padding: EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: task.isCompleted,
                      onChanged: (value) => controller.toggleTask(index),
                      activeColor: Colors.blueAccent,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            task.title,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              decoration: task.isCompleted
                                  ? TextDecoration.lineThrough
                                  : null,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            task.description,
                            style:
                                TextStyle(fontSize: 15, color: Colors.black54),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
