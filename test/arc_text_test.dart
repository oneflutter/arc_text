import 'package:flutter/material.dart';
import 'package:arc_text/arc_text.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('ArcText widget renders correctly with provided parameters', (WidgetTester tester) async {
    // Define the parameters for ArcText.
    const radius = 100.0;
    const text = "Hello, Flutter!";
    const textStyle = TextStyle(color: Colors.black, fontSize: 16);

    // Build the ArcText widget.
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Center(
            child: ArcText(
              radius: radius,
              text: text,
              textStyle: textStyle,
            ),
          ),
        ),
      ),
    );

    // Verify that the ArcText widget renders.
    expect(find.byType(ArcText), findsOneWidget);
  });
}
