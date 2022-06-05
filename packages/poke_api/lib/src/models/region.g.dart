// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'region.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Region _$RegionFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Region',
      json,
      ($checkedConvert) {
        final val = Region(
          name: $checkedConvert(
              'name', (v) => $enumDecode(_$RegionNameEnumMap, v)),
          url: $checkedConvert('url', (v) => v as String),
        );
        return val;
      },
    );

const _$RegionNameEnumMap = {
  RegionName.kanto: 'kanto',
  RegionName.johto: 'johto',
  RegionName.hoenn: 'hoenn',
  RegionName.kalos: 'kalos',
  RegionName.sinnoh: 'sinnoh',
  RegionName.unova: 'unova',
  RegionName.alola: 'alola',
  RegionName.galar: 'galar',
};
