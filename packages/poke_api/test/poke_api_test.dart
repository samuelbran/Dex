import 'package:poke_api/poke_api.dart';
import 'package:test/test.dart';

void main() {
  group('Generation', () {
    group('fromJson', () {
      test('returns GenerationName.generationI for name', () {
        expect(
            Generation.fromJson(<String, dynamic>{
              "id": 1,
              "main_region": {
                "name": "kanto",
                "url": "https://pokeapi.co/api/v2/region/1/"
              },
              "name": "generation-i",
              "pokemon_species": [
                {
                  "name": "bulbasaur",
                  "url": "https://pokeapi.co/api/v2/pokemon-species/1/"
                },
                {
                  "name": "charmander",
                  "url": "https://pokeapi.co/api/v2/pokemon-species/4/"
                },
                {
                  "name": "squirtle",
                  "url": "https://pokeapi.co/api/v2/pokemon-species/7/"
                }
              ]
            }),
            isA<Generation>().having(
              (g) => g.name,
              'name',
              GenerationName.generationI,
            ));
      });
    });
  });
}
