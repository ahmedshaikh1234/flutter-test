// integration_test/app_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cspl_test/main.dart' as app ;
import 'package:integration_test/integration_test.dart'; 


void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('End-to-end test', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    expect(find.text('Login'), findsOneWidget);

    await tester.enterText(find.byType(TextField).at(0), 'user');
    await tester.enterText(find.byType(TextField).at(1), 'pass');

    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();

    expect(find.text('Welcome Home!'), findsOneWidget);
  });
}
