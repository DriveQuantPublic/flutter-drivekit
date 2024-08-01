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
            title = resources.getIdentifier(ResourceId.TITLE, STRING, appName, LogStatusWhenNotFound.ERROR).let { id ->
                getWithDefaultValueIfNotFound(id, { resources.getString(id) }, "DriveKit")
            },
            content = resources.getIdentifier(ResourceId.CONTENT, STRING, appName, LogStatusWhenNotFound.ERROR).let { id ->
                getWithDefaultValueIfNotFound(id, { resources.getString(id) }, "DriveKit is running")
            },
            iconDrawableId = resources.getIdentifier(ResourceId.ICON, DRAWABLE, appName, LogStatusWhenNotFound.ERROR),
            cancelIconDrawableId = resources.getIdentifier(ResourceId.CANCEL_ICON, DRAWABLE, appName, LogStatusWhenNotFound.WARNING).let {
                getWithDefaultValueIfNotFound(it, { it }, null)
            },
            notificationId = resources.getIdentifier(ResourceId.NOTIF_ID, INTEGER, appName, LogStatusWhenNotFound.WARNING).let {
                getWithDefaultValueIfNotFound(it, { resources.getInteger(it) }, null)
            },
            enableCancelValue = resources.getIdentifier(ResourceId.ENABLE_CANCEL, BOOL, appName, LogStatusWhenNotFound.WARNING).let { id ->
                getWithDefaultValueIfNotFound(id, { resources.getBoolean(id) }, false)
            },
            cancelText = resources.getIdentifier(ResourceId.CANCEL_CONTENT, STRING, appName, LogStatusWhenNotFound.WARNING).let { id ->
                getWithDefaultValueIfNotFound(id, { resources.getString(id) }, null)
            },
            context = context
        )

        DriveKitTripAnalysis.tripNotification = notification
        return notification
    }

    private fun <T> getWithDefaultValueIfNotFound(id: Int, provider: () -> T, defaultValue: T) = if (id != 0) provider() else defaultValue

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
        return listOf(DriveKitInitializer::class.java)
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

private object ResourceId {
    const val TITLE = "drivekit_notif_title"
    const val CONTENT = "drivekit_notif_content"
    const val ICON = "drivekit_notif_icon"
    const val CANCEL_ICON = "drivekit_cancelnotif_icon"
    const val NOTIF_ID = "drivekit_notif_defaultIntId"
    const val ENABLE_CANCEL = "drivekit_notif_enablecancel"
    const val CANCEL_CONTENT = "drivekit_notif_cancel"
}

private const val DRAWABLE = "drawable"
private const val STRING = "string"
private const val BOOL = "bool"
private const val INTEGER = "integer"
