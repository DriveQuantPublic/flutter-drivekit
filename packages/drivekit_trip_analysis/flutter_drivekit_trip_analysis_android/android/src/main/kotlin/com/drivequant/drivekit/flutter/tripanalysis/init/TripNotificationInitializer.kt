package com.drivequant.drivekit.flutter.tripanalysis.init

import android.app.PendingIntent
import android.app.TaskStackBuilder
import android.content.Context
import androidx.startup.Initializer
import com.drivequant.drivekit.tripanalysis.DriveKitTripAnalysis
import com.drivequant.drivekit.tripanalysis.entity.TripNotification

class TripNotificationInitializer : Initializer<TripNotification> {
    override fun create(context: Context): TripNotification {
        val resources = context.applicationContext.resources
        val appName = context.applicationContext.packageName

        val notification = buildNotification(
            title = resources.getIdentifier("drivekit_notif_title", STRING, appName).let { id ->
                if (id != 0) resources.getString(id) else "DriveKit"
            },
            content = resources.getIdentifier("drivekit_notif_content", STRING, appName).let { id ->
                if (id != 0) resources.getString(id) else "DriveKit is running"
            },
            iconDrawableId = resources.getIdentifier("drivekit_notif_icon", DRAWABLE, appName),
            cancelIconDrawableId = resources.getIdentifier("drivekit_cancelnotif_icon", DRAWABLE, appName),
            notificationId = resources.getIdentifier("drivekit_notif_defaultIntId", INTEGER, appName).let {
                if (it != 0) resources.getInteger(it) else null
            },
            enableCancelValue = resources.getIdentifier("drivekit_notif_enablecancel", BOOL, appName).let { id ->
                if (id != 0) resources.getBoolean(id) else false
            },
            cancelText = resources.getIdentifier("drivekit_notif_cancel", STRING, appName).let { id ->
                if (id != 0) resources.getString(id) else "Cancel"
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
}

private const val DRAWABLE = "drawable"
private const val STRING = "string"
private const val BOOL = "bool"
private const val INTEGER = "integer"
