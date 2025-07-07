package com.drivequant.drivekit.flutter.example

import android.app.Application
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.dart.DartExecutor
import io.flutter.embedding.engine.loader.FlutterLoader

class FlutterDemoApplication : Application() {
    private val flutterLoader = FlutterLoader()

    override fun onCreate() {
        super.onCreate()

        flutterLoader.startInitialization(this)
        flutterLoader.ensureInitializationComplete(this, null)
        FlutterEngine(this).dartExecutor.executeDartEntrypoint(
            DartExecutor.DartEntrypoint(
                flutterLoader.findAppBundlePath(),
                "registerTripListener"
            )
        )
    }
}
