import 'dart:convert';

import 'package:http/http.dart' as http;

class UselessFactsApiClient {
  final String baseUrl;

  const UselessFactsApiClient(
      {this.baseUrl = 'https://uselessfacts.jsph.pl/api/'});

  Future<String> getTodayFact() async {
    final response =
        await http.get(Uri.parse('${baseUrl}v2/facts/today?language=en'));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final String fact = jsonResponse['text'];
      return fact;
    } else {
      throw Exception('Failed to load today fact');
    }
  }
}
