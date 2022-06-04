class Pokedex {
  final String name;
  final int id;
  final List<PokedexEntry> pokemonEntries;

  Pokedex({
    required this.name,
    required this.id,
    required this.pokemonEntries,
  });

  factory Pokedex.fromJson(Map<String, dynamic> json) {
    return Pokedex(
      name: json['name'] as String,
      id: json['id'] as int,
      pokemonEntries: generatePokemonEntries(json['pokemon_species']),
    );
  }
}

class PokedexEntry {
  final String name;
  final int number;

  PokedexEntry({
    required this.number,
    required this.name,
  });

  factory PokedexEntry.fromJson(Map<String, dynamic> json) {
    return PokedexEntry(
      number: getPokemonNumber(json['url']),
      name: json['name'] as String,
    );
  }
}

List<PokedexEntry> generatePokemonEntries(List<dynamic> entries) {
  List<PokedexEntry> list = [];

  for (var i = 0; i < entries.length; i++) {
    Map<String, dynamic> entry = entries[i];

    list.add(
      PokedexEntry.fromJson(entry),
    );
  }
  list.sort((a, b) => a.number.compareTo(b.number));

  return list;
}

int getPokemonNumber(String url) {
  return int.parse(url.substring(42, url.length - 1));
}
