/// Vehicle class
class Vehicle {
  /// Creates a Vehicle instance
  const Vehicle({
    this.carTypeIndex = 1,
    this.carEngineIndex = 1,
    this.carPower = 150,
    this.carMass = 1400,
    this.carGearboxIndex = 2,
    this.carConsumption = 4.5,
    this.engineDisplacement = 1200,
    this.frontTireSize = '205/55/16',
    this.rearTireSize = '205/55/16',
    this.length = 4.5,
    this.width = 1.8,
    this.height = 1.45,
    this.engineCylinderNb = 4,
    this.driveWheels = 0,
  });

  /// The car type index
  /// default value is 1
  final int carTypeIndex;

  /// The car engine index
  /// default value is 1
  final int carEngineIndex;

  /// The car power
  /// default value is 150
  final int carPower;

  /// The car mass
  /// default value is 1400
  final int carMass;

  /// The car gearbox index
  /// default value is 2
  final int carGearboxIndex;

  /// The car consumption
  /// default value is 4.5
  final double carConsumption;

  /// The engine displacement
  /// default value is 1200
  final int engineDisplacement;

  /// The front tire size
  /// default value is "205/55/16"
  final String frontTireSize;

  /// The rear tire size
  /// default value is "205/55/16"
  final String rearTireSize;

  /// The length
  /// default value is 4.5
  final double length;

  /// The width
  /// default value is 1.8
  final double width;

  /// The height
  /// default value is 1.45
  final double height;

  /// The engine cylinder number
  /// default value is 4
  final int engineCylinderNb;

  /// The drive wheels
  /// default value is 0
  final int driveWheels;
}
