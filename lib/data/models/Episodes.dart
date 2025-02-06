// ignore_for_file: file_names

class EpisodesModel {
  late final int id;
  late final String name;
  late final String airDate;
  late final String episode;
  late final List<String> characters;
  late final String url;
  late final DateTime created;
  EpisodesModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    airDate = json["airDate"];
    episode = json["episode"];
    characters = List.from(json["characters"]);
    url = json["url"];
    created = DateTime.parse(json["created"]);
  }
}
