import 'package:flutter_test/flutter_test.dart';
import 'package:petamigo_ycaro/main.dart';

void main() {
  testWidgets(
    'AmigoPet inicia corretamente',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const AmigoPetApp(),
      );

      expect(
        find.byType(AmigoPetApp),
        findsOneWidget,
      );

      expect(
        find.text('AmigoPet'),
        findsOneWidget,
      );

      expect(
        find.text('Bem-vindo ao AmigoPet!'),
        findsOneWidget,
      );
    },
  );
}
