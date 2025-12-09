import 'package:get/get.dart';
import 'package:todolist/controllers/task_detail_controller.dart';

class TaskDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TaskDetailController());
  }
}
