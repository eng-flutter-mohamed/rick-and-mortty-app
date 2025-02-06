
import '../models/Chracters.dart';


import '../webServices/ChractersWebServices.dart';

class CharactersRepository {
  
  final CharactersWebServices charactersWebServices;

  CharactersRepository({required this.charactersWebServices});

  Future<List<CharacterModel>> fetchAllCharacters() async {
    try {
      final charactersData = await charactersWebServices.getAllCharacters();
      return charactersData
          .map((character) => CharacterModel.fromJson(character))
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch all characters: ${e.toString()}');
    }
  }

  Future<List<CharacterModel>> searchCharacters(String query) async {
    try {
      final searchResults = await charactersWebServices.searchCharacters(query);
      return searchResults
          .map((character) => CharacterModel.fromJson(character))
          .toList();
    } catch (e) {
      throw Exception('Failed to search characters: ${e.toString()}');
    }
  }
}
