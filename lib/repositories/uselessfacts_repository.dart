import 'package:dio/dio.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

const String _baseUrl = 'https://uselessfacts.jsph.pl';

class UselessFactsApiClient {
  final http.Client client;

  UselessFactsApiClient(this.client);

  Future<http.Response> get(Uri url) async {
    return client.get(url);
  }
}

class UselessFactsRepository {
  final UselessFactsApiClient _apiClient;

  UselessFactsRepository(http.Client client, {
    UselessFactsApiClient? apiClient,
  }) : _apiClient = apiClient ?? UselessFactsApiClient(client);

  Future<String> getUselessFact() async {
    final response = await _apiClient.get(Uri.parse('$_baseUrl/random'));
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return jsonResponse['data'];
    } else {
      throw Exception('Failed to load fact');
    }
  }

  Future<http.Response> get(Uri url) async {
    return _apiClient.get(url);
  }
}


class Uselessfacts {
  Future<Map<String, dynamic>?> getUselessfacts({
    required String language,
  }) async {
    try {
      final response = await Dio().get<Map<String, dynamic>>(
          'https://uselessfacts.jsph.pl/api/v2/facts/today?language=en');
      return response.data;
    } on DioError catch (error) {
      throw Exception(
          error.response?.data['error']['message'] ?? 'Unkown error');
    }
  }
}
