// GENERATED CODE - DO NOT MODIFY BY HAND

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
          species: $checkedConvert(
              'species',
              (v) => (v as List<dynamic>)
                  .map((e) =>
                      PokemonSpeciesItem.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
    );

Map<String, dynamic> _$GenerationToJson(Generation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': _$GenerationNameEnumMap[instance.name],
      'species': instance.species,
    };

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
