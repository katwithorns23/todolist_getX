import 'package:get/get.dart';
import '../data/models/task_model.dart';
import '../data/services/local_storage_service.dart';

class GlobalController extends GetxController {
  var tasks = <TaskModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    final loaded = LocalStorageService.loadTasks();
    tasks.assignAll(loaded);
  }

  void addTask(TaskModel task) {
    tasks.add(task);
    _save();
  }

  void updateTask(int index, TaskModel updated) {
    tasks[index] = updated;
    tasks.refresh();
    _save();
  }

  void deleteTask(int index) {
    tasks.removeAt(index);
    _save();
  }

  void toggleTask(int index) {
    tasks[index].isCompleted = !tasks[index].isCompleted;
    tasks.refresh();
    _save();
  }

  void _save() => LocalStorageService.saveTasks(tasks);
}
