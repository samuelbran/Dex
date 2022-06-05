import 'package:json_annotation/json_annotation.dart';

part 'region.g.dart';

enum RegionName {
  kanto,
  johto,
  hoenn,
  kalos,
  sinnoh,
  unova,
  alola,
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
