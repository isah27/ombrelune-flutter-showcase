import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ombrelune/core/widgets/app_button.dart';

void main() {
  testWidgets('AppButton shows uppercase label and fires onPressed', (
    WidgetTester tester,
  ) async {
    int taps = 0;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AppButton(label: 'Next', onPressed: () => taps++),
        ),
      ),
    );
    expect(find.text('NEXT'), findsOneWidget);
    await tester.tap(find.byType(AppButton));
    expect(taps, 1);
  });
}
