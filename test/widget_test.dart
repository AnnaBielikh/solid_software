import 'package:flutter_test/flutter_test.dart';

import 'package:solid_software/src/app.dart';

void main() {
  testWidgets('"Hello there" text display test', (WidgetTester tester) async {
    await tester.pumpWidget(const App());

    expect(find.text('Hello there'), findsOneWidget);
    expect(find.text('Hello world'), findsNothing);
  });
}
