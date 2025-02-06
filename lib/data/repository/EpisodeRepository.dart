// ignore_for_file: file_names

import 'package:dio/dio.dart';

import '../models/Episodes.dart';

class EpisodeRepository {
  final Dio dio; 

  EpisodeRepository({required this.dio});

  Future<List<EpisodesModel>> getEpisodes() async {
    try {
      final response = await dio.get("/episodes");

      if (response.statusCode == 200) {
        final data = response.data;
        if (data.containsKey('results')) {
          return (data['results'] as List)
              .map((episode) => EpisodesModel.fromJson(episode))
              .toList();
        } else {
          throw Exception("No episodes found in the response.");
        }
      } else {
        throw Exception(
            "Failed to fetch episodes. Status code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error while fetching episodes: $e");
      throw Exception("Failed to fetch episodes. Please try again later.");
    }
  }
}
