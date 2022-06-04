import 'package:dex/models/type.dart';

import 'sprite.dart';
import 'ability.dart';

class Pokemon {
  final int baseExperience, height, weight, id;
  final String name;
  final Sprite sprites;
  final List<Ability> abilities;
  final List<Type> types;

  Pokemon({
    required this.id,
    required this.baseExperience,
    required this.height,
    required this.weight,
    required this.name,
    required this.sprites,
    required this.abilities,
    required this.types,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'],
      baseExperience: json['base_experience'],
      height: json['height'],
      weight: json['weight'],
      name: json['name'],
      sprites: Sprite.fromJson(json['sprites']),
      abilities: parseAbilities(json['abilities']),
      types: parseTypes(json['types']),
    );
  }
}

List<Ability> parseAbilities(List<dynamic> abilities) {
  List<Ability> list = [];

  for (var i = 0; i < abilities.length; i++) {
    Map<String, dynamic> ability = abilities[i];

    list.add(
      Ability.fromJson(ability),
    );
  }

  return list;
}

List<Type> parseTypes(List<dynamic> types) {
  List<Type> list = [];

  for (var i = 0; i < types.length; i++) {
    String typeString = types[i]['type']['name'];
    Type type = getTypeByName(typeString);

    list.add(
      type,
    );
  }

  return list;
}
