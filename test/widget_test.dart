import 'package:camdu_pro/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('camDu Pro inicia na tela de câmeras', (tester) async {
    await tester.pumpWidget(const CamDuProApp());
    await tester.pumpAndSettle();

    expect(find.text('camDu Pro'), findsOneWidget);
    expect(find.text('Câmeras'), findsOneWidget);
    expect(find.text('Scanner'), findsOneWidget);
    expect(find.text('Ajustes'), findsOneWidget);
  });
}
