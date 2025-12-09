import 'package:get/get.dart';
import 'package:todolist/bindings/add_task_binding.dart';
import 'package:todolist/bindings/home_binding.dart';
import 'package:todolist/bindings/task_detail_binding.dart';
import 'package:todolist/presentation/screens/add_task_screen.dart';
import 'package:todolist/presentation/screens/home_screen.dart';
import 'package:todolist/presentation/screens/task_detail_screen.dart';
import 'app_routes.dart';

class AppPages {
  static const initial = AppRoutes.HOME;

  static final routes = [
    GetPage(
      name: AppRoutes.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.ADD_TASK,
      page: () => AddTaskView(),
      binding: AddTaskBinding(),
    ),
    GetPage(
      name: AppRoutes.TASK_DETAIL,
      page: () => TaskDetailView(),
      binding: TaskDetailBinding(),
    ),
  ];
}
