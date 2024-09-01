import 'package:flutter/material.dart';
import 'pokemon_service.dart';
import 'pokemon.dart';
import 'pokemon_detail_widget.dart';
import 'search_screen.dart';

class PokemonListWidget extends StatefulWidget {
  @override
  _PokemonListWidgetState createState() => _PokemonListWidgetState();
}

class _PokemonListWidgetState extends State<PokemonListWidget> {
  final PokemonService _pokemonService = PokemonService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokémon List'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchScreen()),
              );
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: _pokemonService.getPokemons(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Pokemon> pokemons = snapshot.data ?? [];
            return ListView.builder(
              itemCount: pokemons.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(pokemons[index].name),
                  onTap: () {
                    // Navegar a la pantalla de detalles del Pokémon seleccionado
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PokemonDetailWidget(pokemon: pokemons[index])),
                    );
                  },
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
