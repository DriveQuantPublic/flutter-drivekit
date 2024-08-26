package com.drivequant.drivekit.flutter.example

import io.flutter.app.FlutterApplication
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.dart.DartExecutor

class FlutterDemoApplication: FlutterApplication() {
    override fun onCreate() {
        super.onCreate()
        FlutterEngine(this).dartExecutor.executeDartEntrypoint(DartExecutor.DartEntrypoint.createDefault())
    }
}