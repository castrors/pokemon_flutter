import 'package:pokemon_flutter/model/move.dart';
import 'package:pokemon_flutter/model/pokemon.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PokemonRepository {
  static Future<List<Pokemon>> getPokemons(http.Client client) async {
    final response = await client.get('https://pokeapi.co/api/v2/pokedex/1/');

    if (response.statusCode != 200) {
      throw Exception('error getting pokemons');
    }

    final data = json.decode(response.body)['pokemon_entries'] as List;
    return data.map((rawData) => Pokemon.fromJson(rawData)).toList();
  }

  static Future<List<Move>> getMoveById(http.Client client, int id) async {
    final response = await client.get('https://pokeapi.co/api/v2/pokemon/$id/');

    if (response.statusCode != 200) {
      throw Exception('error getting moves');
    }

    final data = json.decode(response.body)['moves'] as List;
    return data.map((rawMove) => Move.fromJson(rawMove)).toList();
  }
}