package com.drivequant.drivekit.flutter.tripanalysis.mapper

import com.drivequant.drivekit.core.driver.UpdateUserIdStatus
import com.drivequant.drivekit.core.driver.deletion.DeleteAccountStatus
import com.drivequant.drivekit.core.networking.RequestError
import com.drivequant.drivekit.flutter.tripanalysis.PigeonDeleteAccountStatus
import com.drivequant.drivekit.flutter.tripanalysis.PigeonRequestError
import com.drivequant.drivekit.flutter.tripanalysis.PigeonUpdateUserIdStatus

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
}
