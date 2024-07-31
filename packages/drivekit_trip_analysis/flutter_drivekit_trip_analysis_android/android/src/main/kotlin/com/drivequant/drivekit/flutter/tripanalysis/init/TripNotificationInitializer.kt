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
            title = "A notification initialized from app startup",
            content = "app startup",
            iconDrawableId = resources.getIdentifier("ic_notif", DRAWABLE, appName),
            cancelIconDrawableId = resources.getIdentifier("ic_cancel", DRAWABLE, appName),
            notificationId = 1,
            enableCancelValue = true,
            cancelText = "cancel text",
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
