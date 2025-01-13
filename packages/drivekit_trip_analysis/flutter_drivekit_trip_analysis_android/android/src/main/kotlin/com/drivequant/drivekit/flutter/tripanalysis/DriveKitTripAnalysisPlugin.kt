package com.drivequant.drivekit.flutter.tripanalysis

import android.content.Context
import androidx.core.content.ContextCompat
import com.drivequant.drivekit.flutter.tripanalysis.mapper.PigeonMapper
import com.drivequant.drivekit.flutter.tripanalysis.mapper.PigeonMapper.toPigeonCancelTrip
import com.drivequant.drivekit.flutter.tripanalysis.mapper.PigeonMapper.toPigeonDKCrashFeedbackSeverity
import com.drivequant.drivekit.flutter.tripanalysis.mapper.PigeonMapper.toPigeonDKCrashFeedbackType
import com.drivequant.drivekit.flutter.tripanalysis.mapper.PigeonMapper.toPigeonDKCrashInfo
import com.drivequant.drivekit.flutter.tripanalysis.mapper.PigeonMapper.toPigeonStartMode
import com.drivequant.drivekit.flutter.tripanalysis.mapper.PigeonMapper.toPigeonState
import com.drivequant.drivekit.flutter.tripanalysis.mapper.PigeonMapper.toPigeonTripPoint
import com.drivequant.drivekit.flutter.tripanalysis.mapper.PigeonMapper.toPigeonTripRecordingCanceledState
import com.drivequant.drivekit.flutter.tripanalysis.mapper.PigeonMapper.toPigeonTripRecordingConfirmedState
import com.drivequant.drivekit.flutter.tripanalysis.mapper.PigeonMapper.toPigeonTripRecordingFinishedState
import com.drivequant.drivekit.flutter.tripanalysis.mapper.PigeonMapper.toPigeonTripRecordingStartedState
import com.drivequant.drivekit.flutter.tripanalysis.mapper.PigeonMapper.toPigeonTripResponseStatus
import com.drivequant.drivekit.tripanalysis.DriveKitTripAnalysis
import com.drivequant.drivekit.tripanalysis.TripListener
import com.drivequant.drivekit.tripanalysis.entity.TripPoint
import com.drivequant.drivekit.tripanalysis.model.crashdetection.DKCrashInfo
import com.drivequant.drivekit.tripanalysis.model.triplistener.DKTripRecordingCanceledState
import com.drivequant.drivekit.tripanalysis.model.triplistener.DKTripRecordingConfirmedState
import com.drivequant.drivekit.tripanalysis.model.triplistener.DKTripRecordingFinishedState
import com.drivequant.drivekit.tripanalysis.model.triplistener.DKTripRecordingStartedState
import com.drivequant.drivekit.tripanalysis.service.crashdetection.feedback.CrashFeedbackSeverity
import com.drivequant.drivekit.tripanalysis.service.crashdetection.feedback.CrashFeedbackType
import com.drivequant.drivekit.tripanalysis.service.recorder.CancelTrip
import com.drivequant.drivekit.tripanalysis.service.recorder.StartMode
import com.drivequant.drivekit.tripanalysis.service.recorder.State
import com.drivequant.drivekit.tripanalysis.utils.TripResult
import io.flutter.embedding.engine.plugins.FlutterPlugin
import java.util.HashMap

class DriveKitTripAnalysisPlugin :
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

    override fun isAutoStartActivated(): Boolean =
        DriveKitTripAnalysis.getConfig().autoStartActivate

    override fun activateAutoStart(activate: Boolean) {
        DriveKitTripAnalysis.activateAutoStart(activate)
    }

    override fun isCrashDetectionActivated(): Boolean =
        DriveKitTripAnalysis.getConfig().crashDetection

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

    override fun setStopTimeOut(timeOut: Long) = DriveKitTripAnalysis.setStopTimeOut(timeOut.toInt())

    override fun isMonitoringPotentialTripStart(): Boolean =
        DriveKitTripAnalysis.monitorPotentialTripStart

    override fun setMonitorPotentialTripStart(activate: Boolean) {
        DriveKitTripAnalysis.monitorPotentialTripStart = activate
    }

    override fun setVehicle(vehicle: PigeonVehicle) {
        DriveKitTripAnalysis.setVehicle(PigeonMapper.fromPigeonVehicle(vehicle))
    }

    private fun configureTripListener() {
        DriveKitTripAnalysis.addTripListener(
            object : TripListener {
                override fun tripRecordingStarted(state: DKTripRecordingStartedState) {
                    flutterApi?.tripRecordingStarted(toPigeonTripRecordingStartedState(state)) { echo ->
                        Result.success(echo)
                    }
                }

                override fun tripRecordingConfirmed(state: DKTripRecordingConfirmedState) {
                    flutterApi?.tripRecordingConfirmed(toPigeonTripRecordingConfirmedState(state)) { echo ->
                        Result.success(echo)
                    }
                }

                override fun tripRecordingCanceled(state: DKTripRecordingCanceledState) {
                    flutterApi?.tripRecordingCanceled(toPigeonTripRecordingCanceledState(state)) { echo ->
                        Result.success(echo)
                    }
                }

                override fun tripRecordingFinished(state: DKTripRecordingFinishedState) {
                    flutterApi?.tripRecordingFinished(toPigeonTripRecordingFinishedState(state)) { echo ->
                        Result.success(echo)
                    }
                }

                override fun tripCancelled(cancelTrip: CancelTrip) {
                    flutterApi?.tripCancelled(toPigeonCancelTrip(cancelTrip)) { echo ->
                        Result.success(echo)
                    }
                }

                override fun tripFinished(result: TripResult) {
                    flutterApi?.tripFinished(
                        responseArg = toPigeonTripResponseStatus(result)
                    ) { echo ->
                        Result.success(echo)
                    }
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
                    flutterApi?.crashDetected(toPigeonDKCrashInfo(crashInfo)) { echo ->
                        Result.success(echo)
                    }
                }

                override fun crashFeedbackSent(
                    crashInfo: DKCrashInfo,
                    feedbackType: CrashFeedbackType,
                    severity: CrashFeedbackSeverity
                ) {
                    flutterApi?.crashFeedbackSent(
                        toPigeonDKCrashInfo(crashInfo),
                        toPigeonDKCrashFeedbackType(feedbackType),
                        toPigeonDKCrashFeedbackSeverity(severity)
                    ) { echo ->
                        Result.success(echo)
                    }
                }

                override fun potentialTripStart(startMode: StartMode) {
                    flutterApi?.potentialTripStart(toPigeonStartMode(startMode)) { echo ->
                        Result.success(echo)
                    }
                }

                override fun sdkStateChanged(state: State) {
                    context?.let { context ->
                        ContextCompat.getMainExecutor(context).execute {
                            flutterApi?.sdkStateChanged(toPigeonState(state)) { echo ->
                                Result.success(echo)
                            }
                        }
                    }
                }

                override fun tripPoint(tripPoint: TripPoint) {
                    flutterApi?.tripPoint(toPigeonTripPoint(tripPoint)) { echo ->
                        Result.success(echo)
                    }
                }
            }
        )
    }

    override fun getTripMetadata(): Map<String, String>? = DriveKitTripAnalysis.getTripMetaData()

    override fun updateTripMetadata(key: String, value: String?) {
        DriveKitTripAnalysis.updateTripMetaData(key, value)
    }

    override fun setTripMetadata(metadata: Map<String, String>?) {
        DriveKitTripAnalysis.setTripMetaData(metadata?.let { HashMap(it) })
    }

    override fun deleteTripMetadata(key: String) {
        DriveKitTripAnalysis.deleteTripMetaData(key)
    }

    override fun deleteAllTripMetadata() {
        DriveKitTripAnalysis.deleteTripMetaData()
    }

    override fun getCurrentTripInfo(): PigeonCurrentTripInfo? =
        PigeonMapper.toPigeonCurrentTripInfo(DriveKitTripAnalysis.getCurrentTripInfo())

    override fun getLastTripLocation(): PigeonLastTripLocation? =
        PigeonMapper.toPigeonLastTripLocation(DriveKitTripAnalysis.getLastTripLocation())
}
