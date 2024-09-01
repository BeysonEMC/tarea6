import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'pokemon.dart';

@immutable
class PokemonDetailWidget extends StatelessWidget {
  final Pokemon pokemon;

  PokemonDetailWidget({required this.pokemon}); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('ID: ${pokemon.id}'),
            Text('Name: ${pokemon.name}'),
            Text('URL: ${pokemon.url}'),
          ],
        ),
      ),
    );
  }
}
