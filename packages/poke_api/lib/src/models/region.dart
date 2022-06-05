import 'package:json_annotation/json_annotation.dart';

part 'region.g.dart';

enum RegionName {
  @JsonValue('kanto')
  kanto,
  @JsonValue('johto')
  johto,
  @JsonValue('hoenn')
  hoenn,
  @JsonValue('kalos')
  kalos,
  @JsonValue('sinnoh')
  sinnoh,
  @JsonValue('unova')
  unova,
  @JsonValue('alola')
  alola,
  @JsonValue('galar')
  galar,
}

@JsonSerializable()
class Region {
  const Region({
    required this.name,
    required this.url,
  });

  factory Region.fromJson(Map<String, dynamic> json) => _$RegionFromJson(json);

  final RegionName name;
  final String url;
}
