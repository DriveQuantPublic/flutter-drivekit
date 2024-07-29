package com.drivequant.drivekit.flutter.tripanalysis

import android.content.Context
import com.drivequant.drivekit.flutter.tripanalysis.mapper.PigeonMapper
import com.drivequant.drivekit.tripanalysis.DriveKitTripAnalysis
import io.flutter.embedding.engine.plugins.FlutterPlugin

class DrivekitTripAnalysisPlugin :
    FlutterPlugin,
    AndroidTripAnalysisApi {
    private var context: Context? = null

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        AndroidTripAnalysisApi.setUp(flutterPluginBinding.binaryMessenger, this)
        context = flutterPluginBinding.applicationContext
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        AndroidTripAnalysisApi.setUp(binding.binaryMessenger, null)
        context = null
    }

    override fun getPlatformName(): String = "android"

    override fun activateAutoStart(activate: Boolean) {
        DriveKitTripAnalysis.activateAutoStart(activate)
    }

    override fun activateCrashDetection(activate: Boolean) {
        DriveKitTripAnalysis.activateCrashDetection(activate)
    }

    override fun startTrip() {
        DriveKitTripAnalysis.startTrip()
    }

    override fun stopTrip() {
        DriveKitTripAnalysis.stopTrip()
    }

    override fun cancelTrip() {
        DriveKitTripAnalysis.cancelTrip()
    }

    override fun isTripRunning(): Boolean = DriveKitTripAnalysis.isTripRunning()

    override fun setMonitorPotentialTripStart(activate: Boolean) {
        DriveKitTripAnalysis.monitorPotentialTripStart = activate
    }

    override fun getMonitorPotentialTripStart(): Boolean =
        DriveKitTripAnalysis.monitorPotentialTripStart

    override fun setVehicle(vehicle: PigeonVehicle) {
        DriveKitTripAnalysis.setVehicle(PigeonMapper.fromPigeonVehicle(vehicle))
    }
}
