import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:final_project/Sensor.dart';
import 'package:flutter/services.dart';

//Unit tests for extracting aceleromiter data from the aceleromiter sensor

// write a test that returns data from a mock sensor
// Write Sample Test data into a file

void main() {
  TestWidgetsFlutterBinding.ensureInitialized(); // Render widget before testing
  Sensor sensor = Sensor();
  tearDown(() async => await File('Users').delete()); // Make sure to delete the file if it has already been made

  // Sensor tests, Reading data from a sensor

  test('Sensor Test, checking the mock sensor is functional', () async {
    // Test data/set up values for mock sensor
    const channelName = 'dev.fluttercommunity.plus/sensors/user_accel';
    const fileLocation = 'Users';
    const sensorData = <double>[1.0, 2.0, 3.0];
    _initializeFakeSensorChannel(channelName, sensorData);

    var x;
    final file = File('Users');
    await sensor.accdataCollection(file);
    x = await File('Users').readAsString();
    // File('Users').readAsString().then((String contents) {
    //   (contents);
    //   x = contents;
    //
    //
    expect(x, isNotEmpty);
      // if(x.isNotEmpty){
      //   return true;
      // } else {
      //   return false;
      // }
    // });
    //expect(x.length, 0);

    //expect(event.x, sensorData[0]);
    //expect(event.y, sensorData[1]);
    //expect(event.z, sensorData[2]);

  });

  // Sensor tests, Can the sensor read data to a file ?
  //test("Checking the mock sensor can add to a file"), () {

  //};
}

// Mock sensor using code from sensor_plus test package https://github.com/fluttercommunity/plus_plugins/blob/main/packages/sensors_plus/sensors_plus/test/sensors_test.dart
void _initializeFakeSensorChannel(String channelName, List<double> sensorData) {
  const standardMethod = StandardMethodCodec();

  void emitEvent(ByteData? event) {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .handlePlatformMessage(
      channelName,
      event,
      (ByteData? reply) {},
    );
  }

  TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
      .setMockMessageHandler(channelName, (ByteData? message) async {
    final methodCall = standardMethod.decodeMethodCall(message);
    if (methodCall.method == 'listen') {
      emitEvent(standardMethod.encodeSuccessEnvelope(sensorData));
      emitEvent(null);
      return standardMethod.encodeSuccessEnvelope(null);
    } else if (methodCall.method == 'cancel') {
      return standardMethod.encodeSuccessEnvelope(null);
    } else {
      fail('Expected listen or cancel');
    }
  });
}