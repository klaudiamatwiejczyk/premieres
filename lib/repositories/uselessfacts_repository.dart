import 'package:dio/dio.dart';

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
