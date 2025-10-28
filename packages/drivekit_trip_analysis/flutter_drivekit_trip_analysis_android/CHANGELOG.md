# 1.10.0

    - Update DriveKit version for iOS to 2.22.0 and Android to 2.21.0

# 1.9.0

    - Update DriveKit version for iOS to 2.21.0 and Android to 2.20.0
    - The packages are optimized for iOS 26.
    - Core: The Trip object now includes more granular address fields: departureState, departurePostalCode, departureCountry, arrivalState, arrivalPostalCode, arrivalCountry
    - TripSimulator: The preset crash trip scenario has been updated from a 10 km/h confirmed crash to a 40 km/h confirmed crash, providing a more realistic test case.

# 1.8.1

    - Update DriveKit version for iOS to 2.18.1

# 1.8.0

    - Update DriveKit version to 2.18.0
    - Core: The `Trip` object now includes occupant information, indicating whether the occupant was the driver or a passenger.
    - DriverData: Add a new method `updateDriverPassengerMode()` to declare if the user has been the driver or a passenger of the trip.

# 1.7.0

    - Update DriveKit version to 2.15.0 for Android and 2.15.1 for iOS.
    
# 1.6.0

    - Update DriveKit version to 2.14.0 for Android and 2.14.1 for iOS.
    - Core: The SDK generates a unique installation identifier to detect if the same account is used on multiple devices. Use the new `getInstallationId()` Core method to retrieve the installation identifier.
    - TripAnalysis: Added a link to the real-time tracking map in the accident data accessible via new userLocationUrl field in [DKCrashInfo](https://docs.drivequant.com/trip-analysis/android/references#dkcrashinfo) object.
    
# 1.5.0

    - Update DriveKit version to 2.12.0 for iOS and Android

# 1.4.2

    - Remove [caret syntax](https://dart.dev/tools/pub/dependencies#caret-syntax) to use the exact DriveKit Flutter SDK version.

# 1.4.1

    - Do not run ktlint on clean and build tasks (Android)

# 1.4.0

    - Update DriveKit version to 2.9.1 for iOS

# 1.3.1

    - Update DriveKit version to 2.9.1 for Android

# 1.3.0

    - Update DriveKit version to 2.8.0 for Android

# 1.2.3

    - Update DriveKit version to 2.7.3 for Android

# 1.2.2

    - Update DriveKit version to 2.7.2 for Android

# 1.2.1

    - Update DriveKit version to 2.7.1 for Android

# 1.2.0

    - version 1.2.0 of DriveKit flutter SDK

# 1.1.1

    - version 1.1.1 of DriveKit flutter SDK

# 1.1.0

    - version 1.1.0 of DriveKit flutter SDK

# 1.0.0

    - version 1.0.0 of DriveKit flutter SDK

# 0.0.5

    - version 0.0.5 of DriveKit flutter SDK

# 0.0.4

    - forth version of DriveKit flutter SDK

# 0.0.3

    - third version of DriveKit flutter SDK

# 0.0.2

    - second version of DriveKit flutter SDK

# 0.0.1

    - first version of DriveKit flutter SDK
