import 'package:flutter/material.dart';

enum TypeName {
  normal,
  fighting,
  flying,
  poison,
  ground,
  rock,
  bug,
  ghost,
  steel,
  fire,
  water,
  grass,
  electric,
  psychic,
  ice,
  dragon,
  dark,
  fairy,
  unknown,
  shadow,
}

class Type {
  final String name, svgPath;
  final Color color;

  const Type({
    required this.name,
    required this.color,
    required this.svgPath,
  });
}

Map types = const {
  TypeName.normal: Type(
    name: "Normal",
    color: Color(0xFFA0A29F),
    svgPath: "lib/assets/svg/normal.svg",
  ),
  TypeName.fighting: Type(
    name: "Fighting",
    color: Color(0xFFD3425F),
    svgPath: "lib/assets/svg/fighting.svg",
  ),
  TypeName.flying: Type(
    name: "Flying",
    color: Color(0xFFA1BBEC),
    svgPath: "lib/assets/svg/flying.svg",
  ),
  TypeName.poison: Type(
    name: "Poison",
    color: Color(0xFFA1BBEC),
    svgPath: "lib/assets/svg/poison.svg",
  ),
  TypeName.ground: Type(
    name: "Ground",
    color: Color(0xFFDA7C4D),
    svgPath: "lib/assets/svg/ground.svg",
  ),
  TypeName.rock: Type(
    name: "Rock",
    color: Color(0xFFC9BC8A),
    svgPath: "lib/assets/svg/rock.svg",
  ),
  TypeName.bug: Type(
    name: "Bug",
    color: Color(0xFF92BD2D),
    svgPath: "lib/assets/svg/bug.svg",
  ),
  TypeName.ghost: Type(
    name: "Ghost",
    color: Color(0xFF5F6DBC),
    svgPath: "lib/assets/svg/ghost.svg",
  ),
  TypeName.steel: Type(
    name: "Steel",
    color: Color(0xFF5795A3),
    svgPath: "lib/assets/svg/steel.svg",
  ),
  TypeName.fire: Type(
    name: "Fire",
    color: Color(0xFFFBA64C),
    svgPath: "lib/assets/svg/fire.svg",
  ),
  TypeName.water: Type(
    name: "Water",
    color: Color(0xFF539DDF),
    svgPath: "lib/assets/svg/water.svg",
  ),
  TypeName.grass: Type(
    name: "Grass",
    color: Color(0xFF60BD58),
    svgPath: "lib/assets/svg/grass.svg",
  ),
  TypeName.electric: Type(
    name: "Electric",
    color: Color(0xFFF2D94E),
    svgPath: "lib/assets/svg/electric.svg",
  ),
  TypeName.psychic: Type(
    name: "Psychic",
    color: Color(0xFFFA8582),
    svgPath: "lib/assets/svg/psychic.svg",
  ),
  TypeName.ice: Type(
    name: "Ice",
    color: Color(0xFF76D1C1),
    svgPath: "lib/assets/svg/ice.svg",
  ),
  TypeName.dragon: Type(
    name: "Dragon",
    color: Color(0xFF0C6AC8),
    svgPath: "lib/assets/svg/dragon.svg",
  ),
  TypeName.dark: Type(
    name: "Dark",
    color: Color(0xFF595761),
    svgPath: "lib/assets/svg/dark.svg",
  ),
  TypeName.fairy: Type(
    name: "Fairy",
    color: Color(0xFFEF8FE5),
    svgPath: "lib/assets/svg/fairy.svg",
  ),
};

Type getTypeByName(String typeName) {
  switch (typeName) {
    case 'fighting':
      return types[TypeName.fighting];
    case 'flying':
      return types[TypeName.flying];
    case 'poison':
      return types[TypeName.poison];
    case 'ground':
      return types[TypeName.ground];
    case 'rock':
      return types[TypeName.rock];
    case 'bug':
      return types[TypeName.bug];
    case 'ghost':
      return types[TypeName.ghost];
    case 'steel':
      return types[TypeName.steel];
    case 'fire':
      return types[TypeName.fire];
    case 'water':
      return types[TypeName.water];
    case 'grass':
      return types[TypeName.grass];
    case 'electric':
      return types[TypeName.electric];
    case 'psychic':
      return types[TypeName.psychic];
    case 'ice':
      return types[TypeName.ice];
    case 'dragon':
      return types[TypeName.dragon];
    case 'dark':
      return types[TypeName.dark];
    case 'fairy':
      return types[TypeName.fairy];
    default:
      return types[TypeName.normal];
  }
}
