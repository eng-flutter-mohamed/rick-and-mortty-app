// ignore_for_file: file_names

import '../models/Location.dart';
import '../webServices/locationWebServices.dart';

class Locationrepository {
  final Locationwebservices locationwebservices;

  Locationrepository({required this.locationwebservices});
  Future<List<LocationModel>> getAllLocation() async {
    final locations = await locationwebservices.getAllLocation();
    return locations
        .map((location) => LocationModel.fromJson(location))
        .toList();
  }
}
