import 'package:flutter_test/flutter_test.dart';
import 'package:final_project/main.dart';

//Unit tests for extracting aceleromiter data from the aceleromiter sensor
// Need an instance (Mock) of a sensor class
// Read from Mock sensor into file check if file length is greater then 0



void main() {
  test('Test file created', () async {
    TestWidgetsFlutterBinding.ensureInitialized(); // Render widget
    Sensor sensor = Sensor();
    //x = sensor.userData
    expect(sensor.userData() , 5);
    });

  }




//     await tester.tap(find.byIcon(Icons.add));
//     expect(find.text('1'), findsOneWidget);