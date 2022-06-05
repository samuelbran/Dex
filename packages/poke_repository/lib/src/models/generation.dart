import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:poke_api/poke_api.dart';

part 'generation.g.dart';

@JsonSerializable()
class Generation extends Equatable {
  const Generation({
    required this.id,
    required this.name,
    required this.species,
  });

  factory Generation.fromJson(Map<String, dynamic> json) =>
      _$GenerationFromJson(json);

  Map<String, dynamic> toJson() => _$GenerationToJson(this);

  final int id;
  final GenerationName name;
  final List<PokemonSpeciesItem> species;

  @override
  List<Object> get props => [id, name, species];
}
