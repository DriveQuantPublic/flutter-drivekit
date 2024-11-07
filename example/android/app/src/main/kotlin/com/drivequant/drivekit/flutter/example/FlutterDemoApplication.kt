package com.drivequant.drivekit.flutter.example

import io.flutter.FlutterInjector
import io.flutter.app.FlutterApplication
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.dart.DartExecutor

class FlutterDemoApplication : FlutterApplication() {
    override fun onCreate() {
        super.onCreate()
        val pathToBundle = FlutterInjector.instance().flutterLoader().findAppBundlePath()
        FlutterEngine(this).dartExecutor.executeDartEntrypoint(DartExecutor.DartEntrypoint(pathToBundle, "registerTripListener"))
    }
}
