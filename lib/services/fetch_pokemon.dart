import 'dart:convert';

import 'package:dex/constants.dart';
import 'package:dex/models/pokemon.dart';
import 'package:http/http.dart' as http;

Future<Pokemon> fetchPokemon(int id) async {
  final response = await http.get(Uri.parse("$baseUrl/pokemon/$id"));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Pokemon.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Pokemon');
  }
}
