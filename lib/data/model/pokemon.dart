class Pokemon {
  final int id;
  final String name;
  final String spriteUrl;

  Pokemon({this.id, this.name, this.spriteUrl});

  static Pokemon fromJson(dynamic json) {
    return Pokemon(
        id: json['entry_number'],
        name: json['pokemon_species']['name'],
        spriteUrl:
            'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${json['entry_number']}.png');
  }
}