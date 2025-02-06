// ignore_for_file: avoid_print, file_names

import 'package:dio/dio.dart';

import '../../constants/strings.dart';

class Episodewebservices {
  late Dio dio;
  Episodewebservices() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: Duration(seconds: 30),
      receiveTimeout: Duration(seconds: 30),
    );
    dio = Dio(baseOptions);
  }
  Future<List<Map<String, dynamic>>> getAllEpisode() async {
    Response response = await dio.get("episode");
    try {
      final Map<String, dynamic> episodeData = response.data;
      if (episodeData.containsKey("results")) {
        return List<Map<String, dynamic>>.from(episodeData["results"]);
      } else {
        return [];
      }
    } catch (e) {
      print(" the error is $e");
      return [];
    }
  }
}
