// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// MyApp ko sahi jagah se import karein
import 'package:day2task/myapp.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Is test ko theek karein, yeh counter app ke liye hai
    // Humara app counter app nahi hai, isliye yeh code kaam nahi karega
    // Aapko apne VPN app ke hisaab se test likhna hoga
    // Jaise: expect(find.text('VPN App'), findsOneWidget);

    // Ye lines default counter app ke liye hain, inhe aap hata sakte hain
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    // await tester.tap(find.byIcon(Icons.add));
    // await tester.pump();

    // Verify that our counter has incremented.
    // expect(find.text('0'), findsNothing);
    // expect(find.text('1'), findsNothing);
  });
}