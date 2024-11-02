package com.accelerometer
import android.content.Context
import android.hardware.Sensor
import android.hardware.SensorEvent
import android.hardware.SensorEventListener
import android.hardware.SensorManager
import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.EventChannel

class MainActivity : FlutterActivity(), SensorEventListener {

    private lateinit var sensorManager: SensorManager
    private var accelerometer: Sensor? = null
    private var eventSink: EventChannel.EventSink? = null
    private val CHANNEL = "com.example.accelerometer/data"

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        // Initialize sensor manager and accelerometer
        sensorManager = getSystemService(Context.SENSOR_SERVICE) as SensorManager
        accelerometer = sensorManager.getDefaultSensor(Sensor.TYPE_ACCELEROMETER)

        // Set up event channel
        EventChannel(flutterEngine?.dartExecutor?.binaryMessenger!!, CHANNEL)
                .setStreamHandler(
                        object : EventChannel.StreamHandler {
                            override fun onListen(
                                    arguments: Any?,
                                    events: EventChannel.EventSink?
                            ) {
                                eventSink = events
                                accelerometer?.also { sensor ->
                                    sensorManager.registerListener(
                                            this@MainActivity,
                                            sensor,
                                            SensorManager.SENSOR_DELAY_NORMAL
                                    )
                                }
                            }

                            override fun onCancel(arguments: Any?) {
                                sensorManager.unregisterListener(this@MainActivity)
                                eventSink = null
                            }
                        }
                )
    }

    override fun onSensorChanged(event: SensorEvent?) {
        if (event?.sensor?.type == Sensor.TYPE_ACCELEROMETER) {
            val data = mapOf("x" to event.values[0], "y" to event.values[1], "z" to event.values[2])
            eventSink?.success(data) // Use the eventSink defined in the StreamHandler
        }
    }

    override fun onAccuracyChanged(sensor: Sensor?, accuracy: Int) {
        // Optional, not needed in most cases
    }

    override fun onDestroy() {
        super.onDestroy()
        sensorManager.unregisterListener(this)
    }
}