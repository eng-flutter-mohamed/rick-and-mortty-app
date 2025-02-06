import 'package:dio/dio.dart';

import '../../constants/strings.dart';

class CharactersWebServices {
  late Dio dio;

  CharactersWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
    );
    dio = Dio(options);
  }

  Future<List<Map<String, dynamic>>> getAllCharacters() async {
    try {
      final response = await dio.get("character");
      if (response.data != null && response.data['results'] != null) {
        return List<Map<String, dynamic>>.from(response.data['results']);
      }
      return [];
    } catch (e) {
      throw Exception('Failed to fetch characters: ${e.toString()}');
    }
  }

  Future<List<Map<String, dynamic>>> searchCharacters(String query) async {
    try {
      final response = await dio.get(
        'character',
        queryParameters: {'name': query},
      );
      if (response.data != null && response.data['results'] != null) {
        return List<Map<String, dynamic>>.from(response.data['results']);
      }
      return [];
    } catch (e) {
      throw Exception('Failed to search characters: ${e.toString()}');
    }
  }
}
