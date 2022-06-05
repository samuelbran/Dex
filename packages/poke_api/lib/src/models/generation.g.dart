// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'generation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Generation _$GenerationFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Generation',
      json,
      ($checkedConvert) {
        final val = Generation(
          id: $checkedConvert('id', (v) => v as int),
          name: $checkedConvert(
              'name', (v) => $enumDecode(_$GenerationNameEnumMap, v)),
          pokemonSpecies: $checkedConvert(
              'pokemon_species',
              (v) => (v as List<dynamic>)
                  .map((e) =>
                      PokemonSpeciesItem.fromJson(e as Map<String, dynamic>))
                  .toList()),
          mainRegion: $checkedConvert(
              'main_region', (v) => Region.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
      fieldKeyMap: const {
        'pokemonSpecies': 'pokemon_species',
        'mainRegion': 'main_region'
      },
    );

const _$GenerationNameEnumMap = {
  GenerationName.generationI: 'generation-i',
  GenerationName.generationII: 'generation-ii',
  GenerationName.generationIII: 'generation-iii',
  GenerationName.generationIV: 'generation-iv',
  GenerationName.generationV: 'generation-v',
  GenerationName.generationVI: 'generation-vi',
  GenerationName.generationVII: 'generation-vii',
  GenerationName.generationVIII: 'generation-viii',
};

PokemonSpeciesItem _$PokemonSpeciesItemFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'PokemonSpeciesItem',
      json,
      ($checkedConvert) {
        final val = PokemonSpeciesItem(
          name: $checkedConvert('name', (v) => v as String),
          url: $checkedConvert('url', (v) => v as String),
        );
        return val;
      },
    );
