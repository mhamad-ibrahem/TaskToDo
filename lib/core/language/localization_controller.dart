import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocalizationController extends GetxController {
  bool enableArabicLanguage = false;
  late Locale language;

  Box settingsBox = Hive.box('settingsBox');

  changeLanguage(String codeLanguage) {
    Locale locale = Locale(codeLanguage);
    settingsBox.put('languageKeY', codeLanguage);
    Get.updateLocale(locale);
    language = Locale(codeLanguage);

    enableArabicLanguage = language == const Locale('ar') ? true : false;
    update();
    print(locale);
  }

  @override
  void onInit() {
    var lang = settingsBox.get('languageKeY');
    if (lang == 'ar') {
      language = const Locale('ar');
      enableArabicLanguage = true;
    } else if (lang == 'en') {
      language = const Locale('en');
      enableArabicLanguage = false;
    } else {
      // language = Locale(Get.deviceLocale!.languageCode);
      language = Locale('ar');
      enableArabicLanguage = true;
    }

    super.onInit();
  }
}
