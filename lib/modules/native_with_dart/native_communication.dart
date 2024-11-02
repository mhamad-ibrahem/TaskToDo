import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SensorNativeMobile extends StatefulWidget {
  const SensorNativeMobile({super.key});

  @override
  State<SensorNativeMobile> createState() => _SensorNativeMobileState();
}

class _SensorNativeMobileState extends State<SensorNativeMobile> {
 static const EventChannel _eventChannel =
      EventChannel('com.example.accelerometer/data');
  StreamSubscription? _accelerometerSubscription;
  String accelerometerData = "Waiting for data...";

  @override
  void initState() {
    super.initState();
    _startListening();
  }

  void _startListening() {
    _accelerometerSubscription =
        _eventChannel.receiveBroadcastStream().listen((dynamic event) {
      setState(() {
        accelerometerData =
            "X: ${event['x']}, Y: ${event['y']}, Z: ${event['z']}";
      });
    });
  }

  @override
  void dispose() {
    _accelerometerSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Accelerometer Data"),
        ),
        body: Center(
          child: Text(
            accelerometerData,
            style: TextStyle(fontSize: 24),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}