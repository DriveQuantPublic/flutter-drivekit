package com.drivequant.drivekit.flutter.tripanalysis

import android.content.Context
import com.drivequant.drivekit.flutter.tripanalysis.mapper.PigeonMapper
import com.drivequant.drivekit.flutter.tripanalysis.mapper.PigeonMapper.toPigeonStartMode
import com.drivequant.drivekit.tripanalysis.DriveKitTripAnalysis
import com.drivequant.drivekit.tripanalysis.TripListener
import com.drivequant.drivekit.tripanalysis.entity.PostGeneric
import com.drivequant.drivekit.tripanalysis.entity.PostGenericResponse
import com.drivequant.drivekit.tripanalysis.entity.TripPoint
import com.drivequant.drivekit.tripanalysis.model.crashdetection.DKCrashInfo
import com.drivequant.drivekit.tripanalysis.service.crashdetection.feedback.CrashFeedbackSeverity
import com.drivequant.drivekit.tripanalysis.service.crashdetection.feedback.CrashFeedbackType
import com.drivequant.drivekit.tripanalysis.service.recorder.CancelTrip
import com.drivequant.drivekit.tripanalysis.service.recorder.StartMode
import com.drivequant.drivekit.tripanalysis.service.recorder.State
import io.flutter.embedding.engine.plugins.FlutterPlugin

class DrivekitTripAnalysisPlugin :
    FlutterPlugin,
    AndroidTripAnalysisApi {
    private var context: Context? = null
    private var flutterApi: FlutterTripAnalysisApi? = null

    init {
        configureTripListener()
    }

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        AndroidTripAnalysisApi.setUp(flutterPluginBinding.binaryMessenger, this)
        context = flutterPluginBinding.applicationContext
        flutterApi = FlutterTripAnalysisApi(flutterPluginBinding.binaryMessenger)
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        AndroidTripAnalysisApi.setUp(binding.binaryMessenger, null)
        context = null
        flutterApi = null
    }

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

    private fun configureTripListener() {
        DriveKitTripAnalysis.addTripListener(
            object : TripListener {
                override fun tripCancelled(cancelTrip: CancelTrip) {
                    // TODO implement this method by calling flutter API converting any parameter to pigeonModel
                }

                override fun tripFinished(post: PostGeneric, response: PostGenericResponse) {
                    // TODO implement this method by calling flutter API converting any parameter to pigeonModel
                }

                override fun tripSavedForRepost() {
                    flutterApi?.tripSavedForRepost { echo ->
                        Result.success(echo)
                    }
                }

                override fun tripStarted(startMode: StartMode) {
                    flutterApi?.tripStarted(toPigeonStartMode(startMode)) { echo ->
                        Result.success(echo)
                    }
                }

                override fun beaconDetected() {
                    flutterApi?.beaconDetected { echo ->
                        Result.success(echo)
                    }
                }

                override fun crashDetected(crashInfo: DKCrashInfo) {
                    // TODO implement this method by calling flutter API converting any parameter to pigeonModel
                }

                override fun crashFeedbackSent(
                    crashInfo: DKCrashInfo,
                    feedbackType: CrashFeedbackType,
                    severity: CrashFeedbackSeverity
                ) {
                    // TODO implement this method by calling flutter API converting any parameter to pigeonModel
                }

                override fun potentialTripStart(startMode: StartMode) {
                    flutterApi?.potentialTripStart(toPigeonStartMode(startMode)) { echo ->
                        Result.success(echo)
                    }
                }

                override fun sdkStateChanged(state: State) {
                    // TODO implement this method by calling flutter API converting any parameter to pigeonModel
                }

                override fun tripPoint(tripPoint: TripPoint) {
                    // TODO implement this method by calling flutter API converting any parameter to pigeonModel
                }
            }
        )
    }
}
