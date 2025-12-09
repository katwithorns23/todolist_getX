import 'package:get/get.dart';
import 'package:todolist/controllers/home_controller.dart';
import '../../data/models/task_model.dart';

class TaskDetailController extends GetxController {
  late TaskModel task;
  late int index;

  @override
  void onInit() {
    index = Get.arguments;
    task = Get.find<HomeController>().tasks[index];
    super.onInit();
  }

  void toggleComplete() {
    task.isCompleted = !task.isCompleted;
    Get.find<HomeController>().tasks.refresh();
    Get.find<HomeController>().saveData();
  }

  void deleteTask() {
    Get.find<HomeController>().deleteTask(index);
    Get.back();
  }
}
