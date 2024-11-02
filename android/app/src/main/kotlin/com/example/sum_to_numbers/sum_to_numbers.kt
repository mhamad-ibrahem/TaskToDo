package com.sum_to_numbers
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.embedding.android.FlutterActivity

class MainActivity: FlutterActivity() {
    private val CHANNEL =   "com.example.native/channel"
 override fun configureFlutterEngine(flutterEngine:FlutterEngine) {
    super.configureFlutterEngine(flutterEngine)
    MethodChannel(flutterEngine.dartExecutor.binaryMessenger , CHANNEL).setMethodCallHandler {
        call , result -> if(call.method == "sumNumber"){
            //extract the double values 
            val num1: Double = call.argument<Double>("num1")?:0.0
            val num2: Double = call.argument<Double>("num2")?:0.0

            //sumNumber 
            val sum = num1 + num2
            //return result
            result.success(sum)
 
        }else{
            result.notImplemented()
        }
    }
 }
}
