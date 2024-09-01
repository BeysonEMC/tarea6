import 'package:flutter/material.dart';
import 'pokemon_list_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokédex',
      home: PokemonListWidget(), 
    );
  }
}