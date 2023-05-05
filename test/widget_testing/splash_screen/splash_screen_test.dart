import 'package:doctor_app/features/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lottie/lottie.dart';

void main() {
  testWidgets('Display splash screen upon opening app',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: SplashScreen()));
    final splashScreen = find.byType(LottieBuilder);
    expect(splashScreen, findsOneWidget);
  });
}
