package com.drivequant.drivekit.flutter.tripanalysis.init

import android.annotation.SuppressLint
import android.app.PendingIntent
import android.app.TaskStackBuilder
import android.content.Context
import android.content.res.Resources
import android.util.Log
import androidx.startup.Initializer
import com.drivequant.drivekit.tripanalysis.DriveKitTripAnalysis
import com.drivequant.drivekit.tripanalysis.entity.TripNotification

class TripNotificationInitializer : Initializer<TripNotification> {
    override fun create(context: Context): TripNotification {
        val resources = context.applicationContext.resources
        val appName = context.applicationContext.packageName

        val notification = buildNotification(
            title = resources.getIdentifier("drivekit_notif_title", STRING, appName, LogStatusWhenNotFound.ERROR).let { id ->
                if (id != 0) resources.getString(id) else "DriveKit"
            },
            content = resources.getIdentifier("drivekit_notif_content", STRING, appName, LogStatusWhenNotFound.ERROR).let { id ->
                if (id != 0) resources.getString(id) else "DriveKit is running"
            },
            iconDrawableId = resources.getIdentifier("drivekit_notif_icon", DRAWABLE, appName, LogStatusWhenNotFound.ERROR),
            cancelIconDrawableId = resources.getIdentifier("drivekit_cancelnotif_icon", DRAWABLE, appName, LogStatusWhenNotFound.WARNING).let {
                if (it != 0) it else null
            },
            notificationId = resources.getIdentifier("drivekit_notif_defaultIntId", INTEGER, appName, LogStatusWhenNotFound.WARNING).let {
                if (it != 0) resources.getInteger(it) else null
            },
            enableCancelValue = resources.getIdentifier("drivekit_notif_enablecancel", BOOL, appName, LogStatusWhenNotFound.WARNING).let { id ->
                if (id != 0) resources.getBoolean(id) else false
            },
            cancelText = resources.getIdentifier("drivekit_notif_cancel", STRING, appName, LogStatusWhenNotFound.WARNING).let { id ->
                if (id != 0) resources.getString(id) else null
            },
            context = context
        )

        DriveKitTripAnalysis.tripNotification = notification
        return notification
    }

    private fun buildNotification(
        title: String,
        content: String,
        iconDrawableId: Int,
        enableCancelValue: Boolean,
        cancelIconDrawableId: Int?,
        cancelText: String?,
        notificationId: Int?,
        context: Context
    ) = TripNotification(
        title = title,
        content = content,
        iconId = iconDrawableId
    ).apply {
        this.notificationId = notificationId // TODO create a setter in flutter to change it at exec time
        enableCancel = enableCancelValue
        cancel = cancelText
        cancelIconId = cancelIconDrawableId
        channelId = title
        val intent = context.packageManager.getLaunchIntentForPackage(context.applicationContext.packageName)
        contentIntent = TaskStackBuilder.create(context)
            .addNextIntentWithParentStack(intent)
            .getPendingIntent(0, PendingIntent.FLAG_IMMUTABLE)
    }

    override fun dependencies(): List<Class<out Initializer<*>>> {
        // No dependencies on other libraries.
        return emptyList()
    }

    enum class LogStatusWhenNotFound {
        ERROR,
        WARNING
    }

    @SuppressLint("DiscouragedApi") // As we check for not found resources and ask integrator to specify it
    private fun Resources.getIdentifier(key: String, defType: String?, appName: String?, logStatus: TripNotificationInitializer.LogStatusWhenNotFound): Int {
        getIdentifier(key, defType, appName).let {
            if (it == 0) {
                when (logStatus) {
                    LogStatusWhenNotFound.ERROR -> Log.e("flutter_driveKit", "Mandatory Resource $key not found, see drivekit flutter documentation")
                    LogStatusWhenNotFound.WARNING -> Log.w("flutter_driveKit", "Optional Resource $key not found, see drivekit flutter documentation")
                }
            }
            return it
        }
    }
}

private const val DRAWABLE = "drawable"
private const val STRING = "string"
private const val BOOL = "bool"
private const val INTEGER = "integer"
