import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nymbelelabs/entities/banner_data.dart';
import 'package:nymbelelabs/widget/rounded_rectangular_icon.dart';

void main() {
  testWidgets('RoundedRectangularIcon widget test', (WidgetTester tester) async {
    // Create a mock data object for testing.
    final mockData = Items(
      image: 'https://images.unsplash.com/photo-1490730141103-6cac27aaab94?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80',
      text: 'Test Text',
    );

    // Build our widget and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: RoundedRectangularIcon(data: mockData),
      ),
    );

    // Verify that the image and text are displayed correctly.
    expect(find.text('Test Text'), findsOneWidget);
    expect(find.byType(Image), findsOneWidget);

  });
}
