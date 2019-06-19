import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

import 'package:test_api/test_api.dart';

import '../lib/data/model/pokemon.dart';
import '../lib/data/repository/pokemon_repository.dart';
import 'fixtures/get_pokemon.dart';

class MockClient extends Mock implements http.Client {}

main() {
  group('fetchPokemons', () {
    test('returns a Post if the http call completes successfully', () async {
      final client = MockClient();

      when(client.get('https://pokeapi.co/api/v2/pokedex/1/'))
          .thenAnswer((_) async => http.Response(getPokemonFixture, 200));

      expect(await PokemonRepository.getPokemons(client), isInstanceOf<List<Pokemon>>());
    });

    test('throws an exception if the http call completes with an error', () {
      final client = MockClient();

      when(client.get('https://pokeapi.co/api/v2/pokedex/1/'))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      expect(PokemonRepository.getPokemons(client), throwsException);
    });
  });
}