import 'package:http/http.dart' as http;
import 'package:poke_api/poke_api.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockHttpClient extends Mock implements http.Client {}

class MockResponse extends Mock implements http.Response {}

class FakeUri extends Fake implements Uri {}

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

  group('PokeApiClient', () {
    late http.Client httpClient;
    late PokeApiClient pokeApiClient;

    setUpAll(() {
      registerFallbackValue(FakeUri());
    });

    setUp(() {
      httpClient = MockHttpClient();
      pokeApiClient = PokeApiClient(httpClient: httpClient);
    });

    group('constructor', () {
      test('does not require an httpClient', () {
        expect(PokeApiClient(), isNotNull);
      });
    });

    group('getGeneration', () {
      const generationId = 1;

      test('makes correct http request', () async {
        final response = MockResponse();
        when(() => response.statusCode).thenReturn(200);
        when(() => response.body).thenReturn('{}');
        when(() => httpClient.get(any())).thenAnswer((_) async => response);

        try {
          await pokeApiClient.getGeneration(generationId);
        } catch (_) {}
        verify(
          () => httpClient.get(
            Uri.https('pokeapi.co', '/api/v2/generation/$generationId'),
          ),
        ).called(1);
      });

      test('throws GenerationRequestFailure on non-200 response', () async {
        final response = MockResponse();
        when(() => response.statusCode).thenReturn(400);
        when(() => httpClient.get(any())).thenAnswer((_) async => response);
        expect(
          () async => await pokeApiClient.getGeneration(generationId),
          throwsA(isA<GenerationRequestFailure>()),
        );
      });

      test('throws GenerationNotFoundFailure on empty response', () async {
        final response = MockResponse();
        when(() => response.statusCode).thenReturn(200);
        when(() => response.body).thenReturn('{}');
        when(() => httpClient.get(any())).thenAnswer((_) async => response);
        expect(
          () async => pokeApiClient.getGeneration(generationId),
          throwsA(isA<GenerationNotFoundFailure>()),
        );
      });

      test('returns generation on valid response', () async {
        final response = MockResponse();
        when(() => response.statusCode).thenReturn(200);
        when(() => response.body).thenReturn('''
          {
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
          }
        ''');
        when(() => httpClient.get(any())).thenAnswer((_) async => response);
        final actual = await pokeApiClient.getGeneration(generationId);
        expect(
          actual,
          isA<Generation>()
              .having((g) => g.id, 'id', 1)
              .having((g) => g.name, 'name', GenerationName.generationI)
              .having(
                  (g) => g.pokemonSpecies.length, 'pokemon species length', 3)
              .having((g) => g.pokemonSpecies[0].name,
                  'first pokemon species name', 'bulbasaur')
              .having(
                  (g) => g.mainRegion.name, 'region name', RegionName.kanto),
        );
      });
    });
  });
}
