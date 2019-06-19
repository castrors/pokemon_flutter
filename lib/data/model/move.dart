class Move {
  final String name;

  Move({this.name});

  static Move fromJson(dynamic json) {
    return Move(name: json['move']['name']);
  }
}