import 'dart:async';

import 'package:poke_api/poke_api.dart' hide Generation;
import 'package:poke_repository/poke_repository.dart';

class GenerationFailure implements Exception {}

class PokeRepository {
  PokeRepository({PokeApiClient? pokeApiClient})
      : _pokeApiClient = pokeApiClient ?? PokeApiClient();

  final PokeApiClient _pokeApiClient;

  Future<Generation> getGeneration(int id) async {
    final generation = await _pokeApiClient.getGeneration(id);

    return Generation(
      id: generation.id,
      name: generation.name,
      species: generation.pokemonSpecies,
    );
  }
}
