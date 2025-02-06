import 'package:flutter_bloc/flutter_bloc.dart';
import 'characers_state.dart';
import '../../data/models/Chracters.dart';
import '../../data/repository/chractersRepository.dart';


class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository charactersRepository;

  CharactersCubit(this.charactersRepository) : super(CharactersInitial());

  List<CharacterModel> characters = [];

  void getAllCharacters() async {
    emit(CharactersLoading());
    try {
      final fetchedCharacters = await charactersRepository.fetchAllCharacters();
      characters = fetchedCharacters;
      emit(CharactersLoaded(characters));
    } catch (e) {
      emit(CharactersError('Failed to load characters: ${e.toString()}'));
    }
  }

  void searchCharacters(String query) async {
    emit(CharactersLoading());
    try {
      final searchResults = await charactersRepository.searchCharacters(query);
      emit(CharactersLoaded(searchResults));
    } catch (e) {
      emit(CharactersError('Failed to search characters: ${e.toString()}'));
    }
  }
}
