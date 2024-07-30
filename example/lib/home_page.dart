import 'package:drivekit_example/widgets/initialize_listeners.dart';
import 'package:drivekit_example/widgets/sliver_activate_crash_detection.dart';
import 'package:drivekit_example/widgets/sliver_add_vehicle.dart';
import 'package:drivekit_example/widgets/sliver_auto_start.dart';
import 'package:drivekit_example/widgets/sliver_cancel_trip.dart';
import 'package:drivekit_example/widgets/sliver_delete_account.dart';
import 'package:drivekit_example/widgets/sliver_disable_logging.dart';
import 'package:drivekit_example/widgets/sliver_enable_logging.dart';
import 'package:drivekit_example/widgets/sliver_get_api_key.dart';
import 'package:drivekit_example/widgets/sliver_get_log_file_uri.dart';
import 'package:drivekit_example/widgets/sliver_get_monitor_potential_trip_start.dart';
import 'package:drivekit_example/widgets/sliver_get_user_id.dart';
import 'package:drivekit_example/widgets/sliver_is_token_valid.dart';
import 'package:drivekit_example/widgets/sliver_is_trip_running.dart';
import 'package:drivekit_example/widgets/sliver_permission_request.dart';
import 'package:drivekit_example/widgets/sliver_reset.dart';
import 'package:drivekit_example/widgets/sliver_set_api_key.dart';
import 'package:drivekit_example/widgets/sliver_set_monitor_potential_trip_start.dart';
import 'package:drivekit_example/widgets/sliver_set_user_id.dart';
import 'package:drivekit_example/widgets/sliver_start_trip.dart';
import 'package:drivekit_example/widgets/sliver_stop_trip.dart';
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
            SliverGap(16),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverSetUserId(),
            ),
            SliverGap(10),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverGetUserId(),
            ),
            SliverGap(32),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverAutoStart(),
            ),
            SliverGap(32),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverActivateCrashDetection(),
            ),
            SliverGap(32),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverReset(),
            ),
            SliverGap(32),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverDeleteAccount(),
            ),
            SliverGap(32),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverTokenValidity(),
            ),
            SliverGap(32),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverStartTrip(),
            ),
            SliverGap(10),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverStopTrip(),
            ),
            SliverGap(10),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverCancelTrip(),
            ),
            SliverGap(32),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverIsTripRunning(),
            ),
            SliverGap(32),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverEnableLogging(),
            ),
            SliverGap(10),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverDisableLogging(),
            ),
            SliverGap(10),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverGetLogFileUri(),
            ),
            SliverGap(32),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverSetMonitorPotentialTripStart(),
            ),
            SliverGap(10),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverGetMonitorPotentialTripStart(),
            ),
            SliverGap(32),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverAddVehicle(),
            ),
            SliverGap(32),
          ],
        ),
      ),
    );
  }
}
