import 'package:flutter_test/flutter_test.dart';
import 'package:final_project/Sensor.dart';

//Unit tests for extracting aceleromiter data from the aceleromiter sensor
// Need an instance (Mock) of a sensor class
// Read from Mock sensor into file check if file length is greater then 0 endec up doing equal to 5





void main() {

  // Sensor test, Reading data from a sensor
  test('Test file created', () async {
    TestWidgetsFlutterBinding.ensureInitialized(); // Render widget
    Sensor sensor = Sensor();
    expect(sensor.userData() , 5);
    });

  }




//     await tester.tap(find.byIcon(Icons.add));
//     expect(find.text('1'), findsOneWidget);