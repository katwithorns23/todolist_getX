import 'package:get/get.dart';
import 'package:todolist/controllers/add_task_controller.dart';

class AddTaskBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AddTaskController());
  }
}
