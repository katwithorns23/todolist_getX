import 'package:get/get.dart';
import 'package:todolist/data/models/task_model.dart';
import 'package:todolist/data/services/local_storage_service.dart';

class HomeController extends GetxController {
  var tasks = <TaskModel>[].obs;

  @override
  void onInit() {
    tasks.value = LocalStorageService.loadTasks();
    super.onInit();
  }

  void saveData() {
    LocalStorageService.saveTasks(tasks);
  }

  void addTask(TaskModel task) {
    tasks.add(task);
    saveData();
  }

  void toggleTask(int index) {
    tasks[index].isCompleted = !tasks[index].isCompleted;
    tasks.refresh();
    saveData();
  }

  void deleteTask(int index) {
    tasks.removeAt(index);
    saveData();
  }
}
