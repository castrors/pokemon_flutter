import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:pokemon_flutter/model/move.dart';
import 'package:pokemon_flutter/model/pokemon.dart';

class PokemonRepositoryLocal {
  static Future<List<Pokemon>> getPokemons() async {
    var body = await rootBundle.loadString('assets/pokemons.json');
    final data = json.decode(body)['pokemon_entries'] as List;
    return data.map((rawPokemon) => Pokemon.fromJson(rawPokemon)).toList();
  }

  static Future<List<Move>> getMoveById() async {
    var body = await rootBundle.loadString('assets/moves.json');
    final data = json.decode(body)['moves'] as List;
    return data.map((rawMove) => Move.fromJson(rawMove)).toList();
  }
}