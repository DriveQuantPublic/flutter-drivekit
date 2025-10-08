package com.drivequant.drivekit.flutter.core.mapper

import com.drivequant.drivekit.flutter.tripsimulator.PigeonPresetTrip
import com.drivequant.drivekit.tripsimulator.PresetTrip
import com.drivequant.drivekit.tripsimulator.model.PresetTripCrash1

internal object TripSimulatorPigeonMapper {
    fun fromPresetTrip(pigeonPresetTrip: PigeonPresetTrip): PresetTrip = when (pigeonPresetTrip) {
        PigeonPresetTrip.SHORT_TRIP -> PresetTrip.SHORT_TRIP
        PigeonPresetTrip.MIXED_TRIP -> PresetTrip.MIXED_TRIP
        PigeonPresetTrip.CITY_TRIP -> PresetTrip.CITY_TRIP
        PigeonPresetTrip.SUBURBAN_TRIP -> PresetTrip.SUBURBAN_TRIP
        PigeonPresetTrip.HIGHWAY_TRIP -> PresetTrip.HIGHWAY_TRIP
        PigeonPresetTrip.TRAIN_TRIP -> PresetTrip.TRAIN_TRIP
        PigeonPresetTrip.BOAT_TRIP -> PresetTrip.BOAT_TRIP
        PigeonPresetTrip.BUS_TRIP -> PresetTrip.BUS_TRIP
        PigeonPresetTrip.TRIP_WITH_CRASH_CONFIRMED20KM_H -> PresetTrip.TRIP_WITH_CRASH_1(PresetTripCrash1.CONFIRMED_20KMH)
        PigeonPresetTrip.TRIP_WITH_CRASH_CONFIRMED30KM_H -> PresetTrip.TRIP_WITH_CRASH_1(PresetTripCrash1.CONFIRMED_30KMH)
        PigeonPresetTrip.TRIP_WITH_CRASH_CONFIRMED40KM_H -> PresetTrip.TRIP_WITH_CRASH_1(PresetTripCrash1.CONFIRMED_40KMH)
        PigeonPresetTrip.TRIP_WITH_CRASH_UNCONFIRMED0KM_H -> PresetTrip.TRIP_WITH_CRASH_1(PresetTripCrash1.UNCONFIRMED_0KMH)
        PigeonPresetTrip.TRIP_WITH_CRASH_CONFIRMED30KM_HSTILL_DRIVING -> PresetTrip.TRIP_WITH_CRASH_2_STILL_DRIVING
    }
}
