import '../../data/models/Chracters.dart';

abstract class CharactersState {}

class CharactersInitial extends CharactersState {}

class CharactersLoading extends CharactersState {}

class CharactersLoaded extends CharactersState {
  final List<CharacterModel> characters;

  CharactersLoaded(this.characters);
}

class CharactersError extends CharactersState {
  final String message;

  CharactersError(this.message);
}
