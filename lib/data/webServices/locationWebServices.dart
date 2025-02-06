// ignore_for_file: avoid_print, file_names


import 'package:dio/dio.dart';

import '../../constants/strings.dart';

class Locationwebservices {
  late Dio dio;
  Locationwebservices() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: Duration(seconds: 30),
      receiveTimeout: Duration(seconds: 30),
    );
    dio = Dio(baseOptions);
  }
  Future<List<Map<String, dynamic>>> getAllLocation() async {
    try {
      Response response = await dio.get("location");
      final Map<String,dynamic> locatoinData=response.data;
      if (locatoinData.containsKey("results")) {
        return List<Map<String,dynamic>>.from(locatoinData["results"]);
        
      } else {
        return[];
      }
    } catch (e) {
      print(" this is error$e");
            return[];
    }
  }
}
