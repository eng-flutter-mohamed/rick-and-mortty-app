
import '../../data/models/Episodes.dart';

abstract class EpisodeState {}

class EpisodeInitial extends EpisodeState {}

class EpisodeLoading extends EpisodeState {}

class EpisodeLoded extends EpisodeState {
  final List<EpisodesModel> episodes;

  EpisodeLoded({required this.episodes});
}

class EpisodeError extends EpisodeState {
  final String message;

  EpisodeError({required this.message});
}
