import 'package:flutter_test/flutter_test.dart';
import 'package:pokemon_flutter/main.dart';

void main() {
  testWidgets('finds a Text widget with Pokémon', (WidgetTester tester) async {
    await tester.pumpWidget(PokemonApp());
    expect(find.text('Pokémon'), findsOneWidget);
  });
}
