import 'package:http/http.dart' as http;
import 'dart:convert';
import 'pokemon.dart';

class PokemonService {
  Future<List<Pokemon>> getPokemons() async {
    final response = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=151'));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final pokemons = jsonData['results'].map((pokemon) => Pokemon.fromJson(pokemon)).toList();
      return pokemons;
    } else {
      throw Exception('Failed to load pokemons');
    }
  }
}
