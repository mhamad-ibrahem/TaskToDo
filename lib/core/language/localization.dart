import 'package:get/get.dart';

import 'arabic_translate.dart';
import 'english_translate.dart';

class Localization extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'ar': ar,

        // english translate

        'en': en
      };
}
