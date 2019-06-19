import 'package:flutter/material.dart';
import 'package:pokemon_flutter/model/move.dart';
import 'package:pokemon_flutter/model/pokemon.dart';
import 'package:pokemon_flutter/model/pokemon_repository_local.dart';

void main() {
  runApp(PokemonApp());
}

class PokemonApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokémon',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PokemonPage(title: 'Pokémon'),
    );
  }
}

class PokemonPage extends StatefulWidget {
  PokemonPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _PokemonPageState createState() => _PokemonPageState();
}

class _PokemonPageState extends State<PokemonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder(
        future: PokemonRepositoryLocal.getPokemons(),
        builder: (BuildContext context, AsyncSnapshot<List<Pokemon>> snapshot) {
          if (snapshot.hasData) {
            return ListView(
                children: snapshot.data
                    .map((pokemon) => PokemonListItem(pokemon))
                    .toList());
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class PokemonListItem extends StatelessWidget {
  PokemonListItem(this.pokemon);
  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    var listTile = ListTile(
      leading: CircleAvatar(
        child: Image.network(pokemon.spriteUrl),
        backgroundColor: Colors.transparent,
      ),
      trailing: Text('#${pokemon.id}'),
      title: Text(pokemon.name),
      isThreeLine: false,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PokemonDetail(pokemon: pokemon)),
        );
      },
    );

    return Dismissible(
      key: Key(pokemon.name),
      onDismissed: (dir) => dir == DismissDirection.startToEnd
          ? print('You favorited ${pokemon.name}!')
          : print('You dismissed ${pokemon.name} ...'),
      background: Container(
        color: Colors.green,
      ),
      secondaryBackground: Container(color: Colors.red),
      child: listTile,
    );
  }
}

class PokemonDetail extends StatelessWidget {
  PokemonDetail({this.pokemon});
  final Pokemon pokemon;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(pokemon.name),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Image.network(
                pokemon.spriteUrl,
                scale: 0.1,
              ),
            ),
            Expanded(
              flex: 1,
              child: FutureBuilder(
                future: PokemonRepositoryLocal.getMoveById(),
                builder:
                    (BuildContext context, AsyncSnapshot<List<Move>> snapshot) {
                  if (snapshot.hasData) {
                    return ListView(
                      children: snapshot.data
                          .map((move) => ListTile(title: Text(move.name)))
                          .toList(),
                    );
                  }
                  return Center(child: CircularProgressIndicator());
                },
              ),
            )
          ],
        ));
  }
}
