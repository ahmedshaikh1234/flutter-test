// test/login_page_test.dart
import 'package:cspl_test/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Login Page displays correctly', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: LoginPage()));

    expect(find.text('Login'), findsOneWidget);
    expect(find.text('Username'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.text('Login'), findsOneWidget);
  });

  testWidgets('Valid login navigates to home page', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/home': (context) => Scaffold(body: Text('Home')),
      },
    ));

    await tester.enterText(find.byType(TextField).at(0), 'user');
    await tester.enterText(find.byType(TextField).at(1), 'pass');

    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();

    expect(find.text('Home'), findsOneWidget);
  });

  testWidgets('Invalid login shows error', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: LoginPage()));

    await tester.enterText(find.byType(TextField).at(0), 'wrong_user');
    await tester.enterText(find.byType(TextField).at(1), 'wrong_pass');

    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    expect(find.text('Invalid credentials'), findsOneWidget);
  });
}
