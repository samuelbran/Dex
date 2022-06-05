import 'package:json_annotation/json_annotation.dart';
import 'package:poke_api/src/models/region.dart';

part 'generation.g.dart';

enum GenerationName {
  @JsonValue('generation-i')
  generationI,
  @JsonValue('generation-ii')
  generationII,
  @JsonValue('generation-iii')
  generationIII,
  @JsonValue('generation-iv')
  generationIV,
  @JsonValue('generation-v')
  generationV,
  @JsonValue('generation-vi')
  generationVI,
  @JsonValue('generation-vii')
  generationVII,
  @JsonValue('generation-viii')
  generationVIII,
}

@JsonSerializable()
class Generation {
  const Generation({
    required this.id,
    required this.name,
    required this.pokemonSpecies,
    required this.mainRegion,
  });

  factory Generation.fromJson(Map<String, dynamic> json) =>
      _$GenerationFromJson(json);

  final int id;
  final GenerationName name;
  @JsonKey(name: 'main_region')
  final Region mainRegion;
  final List<PokemonSpeciesItem> pokemonSpecies;
}

@JsonSerializable()
class PokemonSpeciesItem {
  const PokemonSpeciesItem({
    required this.name,
    required this.url,
  });

  factory PokemonSpeciesItem.fromJson(Map<String, dynamic> json) =>
      _$PokemonSpeciesItemFromJson(json);

  final String name, url;
}
