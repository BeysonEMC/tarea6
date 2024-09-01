import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'pokemon.dart';
import 'pokemon_detail_widget.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _formKey = GlobalKey<FormState>();
  String _searchQuery = '';

  Future<Pokemon> _searchPokemon(String query) async {
  final url = 'https://pokeapi.co/api/v2/pokemon/$query';
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body);
    return Pokemon.fromJson(jsonData);
  } else {
    throw Exception('Error al buscar el Pokémon');
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokédex'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Buscar Pokémon',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Por favor, ingrese un nombre de Pokémon';
                }
                return null;
              },
              onSaved: (value) => _searchQuery = value!,
            ),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  Pokemon pokemon = await _searchPokemon(_searchQuery);
                  // Navegar a la pantalla de detalles del Pokémon
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PokemonDetailWidget(pokemon: pokemon)),
                  );
                }
              },
              child: Text('Buscar'),
            ),
          ],
        ),
      ),
    );
  }
}
