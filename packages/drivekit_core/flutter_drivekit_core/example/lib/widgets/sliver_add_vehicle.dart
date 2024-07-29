import 'package:flutter/material.dart';
import 'package:flutter_drivekit_trip_analysis/flutter_drivekit_trip_analysis.dart';

class SliverAddVehicle extends StatefulWidget {
  const SliverAddVehicle({super.key});

  @override
  State<SliverAddVehicle> createState() => _SliverAddVehicleState();
}

class _SliverAddVehicleState extends State<SliverAddVehicle> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ElevatedButton(
        onPressed: () {
          DrivekitTripAnalysis.setVehicle(
            const Vehicle(
              carTypeIndex: 2,
              carEngineIndex: 2,
              carPower: 200,
              carMass: 1500,
              carGearboxIndex: 3,
              carConsumption: 6.5,
              carAutoGearboxNumber: 1,
              engineDisplacement: 1500,
              carPassengers: 2,
              length: 4.7,
              width: 1.9,
              height: 1.5,
              engineCylinderNb: 6,
              driveWheels: 1,
            ),
          );
        },
        child: const Text('Add Default Vehicle'),
      ),
    );
  }
}
