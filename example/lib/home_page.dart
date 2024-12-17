import 'package:drivekit_example/widgets/initialize_listeners.dart';
import 'package:drivekit_example/widgets/sliver_add_vehicle.dart';
import 'package:drivekit_example/widgets/sliver_auto_start.dart';
import 'package:drivekit_example/widgets/sliver_crash_detection.dart';
import 'package:drivekit_example/widgets/sliver_delete_account.dart';
import 'package:drivekit_example/widgets/sliver_get_api_key.dart';
import 'package:drivekit_example/widgets/sliver_get_current_trip_info.dart';
import 'package:drivekit_example/widgets/sliver_is_token_valid.dart';
import 'package:drivekit_example/widgets/sliver_logs.dart';
import 'package:drivekit_example/widgets/sliver_monitor_potential_trip_start.dart';
import 'package:drivekit_example/widgets/sliver_permission_request.dart';
import 'package:drivekit_example/widgets/sliver_remove_all_device_configuration_listeners.dart';
import 'package:drivekit_example/widgets/sliver_remove_all_drivekit_listeners.dart';
import 'package:drivekit_example/widgets/sliver_remove_all_trip_listeners.dart';
import 'package:drivekit_example/widgets/sliver_reset.dart';
import 'package:drivekit_example/widgets/sliver_set_api_key.dart';
import 'package:drivekit_example/widgets/sliver_stop_timeout.dart';
import 'package:drivekit_example/widgets/sliver_trip_lifecycle.dart';
import 'package:drivekit_example/widgets/sliver_trip_metadata.dart';
import 'package:drivekit_example/widgets/sliver_trip_simulator.dart';
import 'package:drivekit_example/widgets/sliver_trips.dart';
import 'package:drivekit_example/widgets/sliver_user_id.dart';
import 'package:drivekit_example/widgets/sliver_user_info.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const InitializeListeners(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text('DriveKit Example'),
              pinned: true,
            ),
            SliverGap(32),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverPermissionRequest(),
            ),
            SliverGap(32),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverSetApiKey(),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverGetApiKey(),
            ),
            SliverGap(32),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverUserId(),
            ),
            SliverGap(32),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverTokenValidity(),
            ),
            SliverGap(32),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverUserInfo(),
            ),
            SliverGap(32),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverAutoStart(),
            ),
            SliverGap(32),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverCrashDetection(),
            ),
            SliverGap(32),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverTripLifecycle(),
            ),
            SliverGap(32),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverLogs(),
            ),
            SliverGap(32),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverStopTimeout(),
            ),
            SliverGap(32),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverMonitorPotentialTripStart(),
            ),
            SliverGap(32),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverGetCurrentTripInfo(),
            ),
            SliverGap(32),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverAddVehicle(),
            ),
            SliverGap(32),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverTripSimulation(),
            ),
            SliverGap(32),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverTrips(),
            ),
            SliverGap(32),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverTripMetadata(),
            ),
            SliverGap(32),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverRemoveAllDriveKitListeners(),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverRemoveAllDeviceConfigurationListeners(),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverRemoveAllTripListeners(),
            ),
            SliverGap(32),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverDeleteAccount(),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverReset(),
            ),
            SliverGap(32),
          ],
        ),
      ),
    );
  }
}
