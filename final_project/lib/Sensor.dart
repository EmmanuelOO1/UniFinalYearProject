import 'package:sensors_plus/sensors_plus.dart';
import 'dart:io';

//Mock Sensor class
// acc refers to the Accelerometer Sensor

class Sensor {
  // Documentation on sensors plus https://pub.dev/packages/sensors_plus
  accdataCollection(File file) async {
       userAccelerometerEvents.listen(
          (UserAccelerometerEvent event) async {
            await file?.writeAsString('$event \n', mode: FileMode.append);
          }
      );




  }
// example acc data [AccelerometerEvent (x: 0.0, y: 9.8, z: 0.0)]
}
