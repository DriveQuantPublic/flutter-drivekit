import 'package:flutter_drivekit_core_platform_interface/flutter_drivekit_core_platform_interface.dart';
import 'package:mocktail/mocktail.dart';

class MockUserInfo extends Mock implements UserInfo {}

class MockDriveKitListener extends Mock implements DriveKitListener {}

class MockDKDeviceConfigurationListener extends Mock
    implements DKDeviceConfigurationListener {}
