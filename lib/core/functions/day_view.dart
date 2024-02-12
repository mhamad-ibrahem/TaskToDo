import 'package:get/get.dart';

String viewDay(String value) {
  if (value == 'Saturday') {
    return 'Saturday'.tr;
  } else if (value == 'Friday') {
    return 'Friday'.tr;
  } else if (value == 'Thursday') {
    return 'Thursday'.tr;
  } else if (value == 'Wednesday') {
    return 'Wednesday'.tr;
  } else if (value == 'Tuesday') {
    return 'Tuesday'.tr;
  } else if (value == 'Monday') {
    return 'Monday'.tr;
  } else {
    return 'Sunday'.tr;
  }
}
