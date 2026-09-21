import 'package:flutter_test/flutter_test.dart';
import 'package:gerador_qr/main.dart';

void main() {
  testWidgets('exibe orientação antes da entrada de texto', (tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.text('Digite algo para gerar seu QR Code'), findsOneWidget);
  });
}
