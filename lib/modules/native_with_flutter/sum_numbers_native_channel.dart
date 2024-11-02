import 'package:flutter/services.dart';


class SumNumbersNativeChannel {
  //make channel
  static const platform = MethodChannel('com.example.native/channel');
  Future<dynamic> getSumNumbersBuNative(
      {required double num1, required double num2}) async {
    try {
      final Map<String, dynamic> params = {
        'num1': num1,
        'num2': num2,
      };
      //invoke method
      final double result = await platform.invokeMethod('sumNumber', params);
      print("native result is : $result ");
      return result;
    } on PlatformException catch (e) {
      throw "Failed to sum numbers ${e.message}";
    }
  }
}
