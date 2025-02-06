// ignore_for_file: file_names

class LocationModel {
  late final int id;
  late final String name;
  late final String type;
  late final String dimension;
  late final List<String> residents;
  late final String url;
  late final DateTime created;
  LocationModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    type = json["type"];
    dimension = json["dimension"];
    residents = List<String>.from(json["residents"]);
    url = json["url"];
    created = DateTime.parse(json["created"]);
  }
}
