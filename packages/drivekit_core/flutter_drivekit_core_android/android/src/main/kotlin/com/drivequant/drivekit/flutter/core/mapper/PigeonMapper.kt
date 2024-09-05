package com.drivequant.drivekit.flutter.core.mapper

import com.drivequant.drivekit.core.SynchronizationType
import com.drivequant.drivekit.core.deviceconfiguration.DKDeviceConfigurationEvent
import com.drivequant.drivekit.core.driver.UpdateUserIdStatus
import com.drivequant.drivekit.core.driver.UserInfo
import com.drivequant.drivekit.core.driver.UserInfoGetStatus
import com.drivequant.drivekit.core.driver.deletion.DeleteAccountStatus
import com.drivequant.drivekit.core.networking.RequestError
import com.drivequant.drivekit.flutter.core.PigeonDeleteAccountStatus
import com.drivequant.drivekit.flutter.core.PigeonDeviceConfigurationEvent
import com.drivequant.drivekit.flutter.core.PigeonRequestError
import com.drivequant.drivekit.flutter.core.PigeonSynchronizationType
import com.drivequant.drivekit.flutter.core.PigeonUpdateUserIdStatus
import com.drivequant.drivekit.flutter.core.PigeonUserInfo
import com.drivequant.drivekit.flutter.core.PigeonUserInfoSyncStatus

internal object PigeonMapper {

    fun UpdateUserIdStatus.toPigeon(): PigeonUpdateUserIdStatus = when (this) {
        UpdateUserIdStatus.UPDATED -> PigeonUpdateUserIdStatus.UPDATED
        UpdateUserIdStatus.FAILED_TO_UPDATE -> PigeonUpdateUserIdStatus.FAILED_TO_UPDATE
        UpdateUserIdStatus.INVALID_USER_ID -> PigeonUpdateUserIdStatus.INVALID_USER_ID
        UpdateUserIdStatus.ALREADY_USED -> PigeonUpdateUserIdStatus.ALREADY_USED
        UpdateUserIdStatus.SAVED_FOR_REPOST -> PigeonUpdateUserIdStatus.SAVED_FOR_REPOST
    }

    fun RequestError.toPigeon(): PigeonRequestError = when (this) {
        RequestError.NO_NETWORK -> PigeonRequestError.NO_NETWORK
        RequestError.UNAUTHENTICATED -> PigeonRequestError.UNAUTHENTICATED
        RequestError.FORBIDDEN -> PigeonRequestError.FORBIDDEN
        RequestError.SERVER_ERROR -> PigeonRequestError.SERVER_ERROR
        RequestError.CLIENT_ERROR -> PigeonRequestError.CLIENT_ERROR
        RequestError.UNKNOWN_ERROR -> PigeonRequestError.UNKNOWN_ERROR
        RequestError.LIMIT_REACHED -> PigeonRequestError.LIMIT_REACHED
    }

    fun DeleteAccountStatus.toPigeon(): PigeonDeleteAccountStatus = when (this) {
        DeleteAccountStatus.SUCCESS -> PigeonDeleteAccountStatus.SUCCESS
        DeleteAccountStatus.FAILED_TO_DELETE -> PigeonDeleteAccountStatus.FAILED_TO_DELETE
        DeleteAccountStatus.FORBIDDEN -> PigeonDeleteAccountStatus.FORBIDDEN
    }

    fun DKDeviceConfigurationEvent.toPigeon(): PigeonDeviceConfigurationEvent = when (this) {
        is DKDeviceConfigurationEvent.ActivityPermission -> {
            if (this.isValid) {
                PigeonDeviceConfigurationEvent.ACTIVITY_PERMISSION_VALID
            } else {
                PigeonDeviceConfigurationEvent.ACTIVITY_PERMISSION_INVALID
            }
        }
        is DKDeviceConfigurationEvent.AppBatteryOptimisation -> {
            if (this.isValid) {
                PigeonDeviceConfigurationEvent.APP_BATTERY_OPTIMISATION_VALID
            } else {
                PigeonDeviceConfigurationEvent.APP_BATTERY_OPTIMISATION_INVALID
            }
        }
        is DKDeviceConfigurationEvent.AutoResetPermission -> {
            if (this.isValid) {
                PigeonDeviceConfigurationEvent.AUTO_RESET_PERMISSION_VALID
            } else {
                PigeonDeviceConfigurationEvent.AUTO_RESET_PERMISSION_INVALID
            }
        }
        is DKDeviceConfigurationEvent.BluetoothSensor -> {
            if (this.isValid) {
                PigeonDeviceConfigurationEvent.BLUETOOTH_SENSOR_VALID
            } else {
                PigeonDeviceConfigurationEvent.BLUETOOTH_SENSOR_INVALID
            }
        }
        is DKDeviceConfigurationEvent.LocationPermission -> {
            if (this.isValid) {
                PigeonDeviceConfigurationEvent.LOCATION_PERMISSION_VALID
            } else {
                PigeonDeviceConfigurationEvent.LOCATION_PERMISSION_INVALID
            }
        }
        is DKDeviceConfigurationEvent.LocationSensor -> {
            if (this.isValid) {
                PigeonDeviceConfigurationEvent.LOCATION_SENSOR_VALID
            } else {
                PigeonDeviceConfigurationEvent.LOCATION_SENSOR_INVALID
            }
        }
        is DKDeviceConfigurationEvent.NearbyDevicesPermission -> {
            if (this.isValid) {
                PigeonDeviceConfigurationEvent.NEARBY_DEVICE_PERMISSION_VALID
            } else {
                PigeonDeviceConfigurationEvent.NEARBY_DEVICE_PERMISSION_INVALID
            }
        }
        is DKDeviceConfigurationEvent.NotificationPermission -> {
            if (this.isValid) {
                PigeonDeviceConfigurationEvent.NOTIFICATION_PERMISSION_VALID
            } else {
                PigeonDeviceConfigurationEvent.NOTIFICATION_PERMISSION_INVALID
            }
        }
    }

    fun UserInfoGetStatus.toPigeon(): PigeonUserInfoSyncStatus = when (this) {
        UserInfoGetStatus.SUCCESS -> PigeonUserInfoSyncStatus.SUCCESS
        UserInfoGetStatus.CACHE_DATA_ONLY -> PigeonUserInfoSyncStatus.CACHE_DATA_ONLY
        UserInfoGetStatus.FAILED_TO_SYNC_USER_INFO_CACHE_ONLY -> PigeonUserInfoSyncStatus.FAILED_TO_SYNC_USER_INFO_CACHE_ONLY
    }

    fun UserInfo?.toPigeon(): PigeonUserInfo? = this?.let {
        PigeonUserInfo(this.firstname, this.lastname, this.pseudo)
    }

    fun PigeonSynchronizationType.toModel(): SynchronizationType = when (this) {
        PigeonSynchronizationType.DEFAULT_SYNC -> SynchronizationType.DEFAULT
        PigeonSynchronizationType.CACHE -> SynchronizationType.CACHE
    }
}
