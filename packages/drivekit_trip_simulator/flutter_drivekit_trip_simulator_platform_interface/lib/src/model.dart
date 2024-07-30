/// Preset trip enumeration used for trip simulation
enum PresetTrip {
  /// Trip too short that does not allow to rate the driver's behavior
  shortTrip,

  /// A 15-minute mixed trip in urban and suburban areas
  mixedTrip,

  /// A 20-minute city trip
  cityTrip,

  /// A 30-minute trip performed in a suburban environment mostly
  suburbanTrip,

  /// A 55-minute highway trip
  highwayTrip,

  /// Trip recorded in a train
  trainTrip,

  /// Trip recorded in a bus
  boatTrip,

  /// Trip recorded in a boat
  busTrip,

  /// A short trip with a collision at 30 km/h that occurs 137 seconds
  /// after the trip begins and that corresponds to a confirmed accident
  tripWithCrashConfirmed30KmH,

  /// A short trip with a collision at 20 km/h that occurs 141 seconds
  /// after the trip begins and that corresponds to a confirmed accident
  tripWithCrashConfirmed20KmH,

  /// A short trip with a collision at 10 km/h that occurs 146 seconds
  /// after the trip begins and that corresponds to a confirmed accident
  tripWithCrashConfirmed10KmH,

  /// A short trip with a collision during a vehicle stop that occurs 159
  /// seconds after the trip begins and that corresponds to an unconfirmed
  /// accident
  tripWithCrashUnconfirmed0KmH,

  /// A trip to with a collision at 30km/h that occures 95 seconds after
  /// the trip begins and that corresponds to a confirmed accident, after
  /// which the driver continue driving.
  tripWithCrashConfirmed30KmHStillDriving
}
