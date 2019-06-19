import 'package:flutter_test/flutter_test.dart';
import 'package:pokemon_flutter/main.dart';
// import 'package:flutter/material.dart';
// import 'package:mockito/mockito.dart';
// import 'package:pokemon_flutter/data/repository/pokemon_repository_local.dart';
// import 'package:pokemon_flutter/data/model/pokemon.dart';

void main() {
  testWidgets('finds a Text widget with Pokémon', (WidgetTester tester) async {
    await tester.pumpWidget(PokemonApp());
    expect(find.text('Pokémon'), findsOneWidget);
  });

  // testWidgets('tap listtile and find bulbasaur', (WidgetTester tester) async {
  //   final widget = PokemonPage(title: 'Pokémon', future: Future.value([
  //         Pokemon(
  //           id: 1,
  //           name: 'bulbasaur',
  //         )
  //       ]));
  
  //   await tester.pumpWidget(widget);
  //   await tester.pump();
  //   expect(find.byType(ListTile), findsOneWidget);
  // });
}
