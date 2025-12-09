import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/data/services/local_storage_service.dart';
import 'package:todolist/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await LocalStorageService.init(); // Initialize GetStorage

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "To Do App",
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
    );
  }
}
