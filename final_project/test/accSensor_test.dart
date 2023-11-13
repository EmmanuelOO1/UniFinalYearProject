import 'package:flutter_test/flutter_test.dart';
import 'package:final_project/Sensor.dart';
import 'package:flutter/services.dart';

//Unit tests for extracting aceleromiter data from the aceleromiter sensor

// Need an instance (Mock) of a sensor class
// Read from Mock sensor into file check if file length is greater then 0 endec up doing equal to 5

// Convert fake sensor into an acc mock sensor

// Create a mock sensor
// Take inputs from a mock sensor
// Read inputs from sensor into a file

// write a test that returns data from a mock sensor

void main() {
  TestWidgetsFlutterBinding.ensureInitialized(); // Render widget before testing
  Sensor sensor = Sensor();
  // Sensor test, Reading data from a sensor

  test('Sensor Test, checking the mock sensor is functional', () async {
    // Test data/set up values for mock sensor
    const channelName = 'dev.fluttercommunity.plus/sensors/user_accel';
    const sensorData = <double>[1.0, 2.0, 3.0];
    _initializeFakeSensorChannel(channelName, sensorData);

    final event = await sensor.accdataCollection();

    expect(event.x, sensorData[0]);
    expect(event.y, sensorData[1]);
    expect(event.z, sensorData[2]);

  });
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

//     await tester.tap(find.byIcon(Icons.add));
//     expect(find.text('1'), findsOneWidget);
