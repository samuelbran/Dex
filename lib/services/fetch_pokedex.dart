import 'dart:convert';

import 'package:dex/constants.dart';
import 'package:dex/models/pokedex.dart';
import 'package:http/http.dart' as http;

Future<Pokedex> fetchPokedex(String id) async {
  final response = await http.get(Uri.parse("$baseUrl/generation/$id"));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Pokedex.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Pokedex');
  }
}
