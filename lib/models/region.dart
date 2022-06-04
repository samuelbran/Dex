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

class Region {
  final String name, id;

  const Region({
    required this.name,
    required this.id,
  });
}

Map<RegionName, Region> regions = const {
  RegionName.kanto: Region(name: 'Kanto', id: '1'),
  RegionName.johto: Region(name: 'Johto', id: '2'),
  RegionName.hoenn: Region(name: 'Hoenn', id: '3'),
  RegionName.sinnoh: Region(name: 'Sinnoh', id: '4'),
  RegionName.unova: Region(name: 'Unova', id: '5'),
  RegionName.kalos: Region(name: 'Kalos', id: '6'),
  RegionName.alola: Region(name: 'Alola', id: '7'),
  RegionName.galar: Region(name: 'Galar', id: '8'),
};
