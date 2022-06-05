import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:poke_api/poke_api.dart';

/// Exception thrown when getGeneration fails.
class GenerationRequestFailure implements Exception {}

/// Exception thrown when id for provided generation is not found.
class GenerationNotFoundFailure implements Exception {}

class PokeApiClient {
  PokeApiClient({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  static const _baseUrl = 'https://pokeapi.co/api/v2';
  final http.Client _httpClient;

  Future<Generation> getGeneration(int generationId) async {
    final generationRequest = Uri.https(_baseUrl, '/generation/$generationId');
    final generationResponse = await _httpClient.get(generationRequest);

    if (generationResponse.statusCode != 200) {
      throw GenerationRequestFailure();
    }

    final bodyJson =
        jsonDecode(generationResponse.body) as Map<String, dynamic>;

    if (bodyJson.isEmpty) {
      throw GenerationNotFoundFailure();
    }

    return Generation.fromJson(bodyJson);
  }
}
