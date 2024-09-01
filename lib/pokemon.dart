class Pokemon {
  final int id;
  final String name;
  final String url;
  final List<String> types;

  Pokemon({required this.id, required this.name, required this.url, required this.types});

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'],
      name: json['name'],
      url: json['url'],
      types: json['types'].map((type) => type['type']['name']).toList(),
    );
  }
}
