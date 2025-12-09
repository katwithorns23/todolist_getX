import 'package:get_storage/get_storage.dart';
import '../models/task_model.dart';

class LocalStorageService {
  static final _box = GetStorage();
  static const String _key = 'tasks';

  static Future<void> init() async {
    await GetStorage.init();
  }

  static void saveTasks(List<TaskModel> tasks) {
    List taskList = tasks.map((t) => t.toMap()).toList();
    _box.write(_key, taskList);
  }

  static List<TaskModel> loadTasks() {
    List saved = _box.read(_key) ?? [];
    return saved.map((t) => TaskModel.fromMap(t)).toList();
  }
}
