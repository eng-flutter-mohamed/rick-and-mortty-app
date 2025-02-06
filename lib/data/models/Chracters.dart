
// ignore_for_file: file_names

class CharacterModel {
  late final int id;
  late final String name;
  late final String status;
  late final String species;
  late final String type;
  late final String gender;
  late final Origin origin;
  late final Location location;
  late final String image;
  late final List<String> episode;
  late final String url;
  late final DateTime created;
  CharacterModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    status = json["status"];
    species = json["species"];
    type = json["type"];
    gender = json["gender"];
    origin = Origin.fromJson(json["origin"]);
    location = Location.fromJson(json["location"]);
    image = json["image"];
    episode = List<String>.from(json["episode"]) ;
    url = json["url"];
    created = DateTime.parse(json["created"]);
  }
}

class Origin {
  late final String name;
  late final String url;
  Origin.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    url = json["url"];
  }
}

class Location {
  late final String name;
  late final String url;
  Location.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    url = json["url"];
  }
}
