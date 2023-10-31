import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:get/get.dart';
import 'package:tasks/modules/main_page/view/pages/main_page.dart';

import 'core/language/localization.dart';
import 'core/language/localization_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //init hive
  await Hive.initFlutter();
  //open hive box
  await Hive.openBox('myBox');
  await Hive.openBox('settingsBox');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final LocalizationController controller = Get.put(LocalizationController());
  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: controller.language,
      translations: Localization(),
      home: MainPage(),
    );
  }
}
