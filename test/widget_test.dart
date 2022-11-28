// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_camera/main.dart';
import 'package:integration_test/integration_test.dart';

Future<void> main() async {
  testWidgets('Check camera is working', (WidgetTester tester) async {

    IntegrationTestWidgetsFlutterBinding.ensureInitialized();

    final cameras = await availableCameras();
    final firstCamera = cameras.first;
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: TakePictureScreen(camera: firstCamera),
    ));

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();

    // Verify that our counter has incremented.
    expect(find.text('Displaying the picture'), findsOneWidget);
  });
}
