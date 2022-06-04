class Sprite {
  final String backDefault,
      backShiny,
      frontDefault,
      frontShiny,
      officialArtWork;
  // final String? backFemale, backShinyFemale, frontFemale, frontShinyFemale;

  Sprite({
    required this.backDefault,
    required this.backShiny,
    required this.frontDefault,
    required this.frontShiny,
    required this.officialArtWork,
  });

  factory Sprite.fromJson(Map<String, dynamic> json) {
    return Sprite(
      backDefault: json['back_default'],
      backShiny: json['back_shiny'],
      frontDefault: json['front_default'],
      frontShiny: json['front_shiny'],
      officialArtWork: json['other']['official-artwork']['front_default'],
    );
  }
}
