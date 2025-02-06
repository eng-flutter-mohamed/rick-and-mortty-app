import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/Episodes.dart';
import '../../data/repository/EpisodeRepository.dart';
import 'episode_state.dart';



class EpisodeCubit extends Cubit<EpisodeState> {
  final EpisodeRepository episodeRepository;

  List<EpisodesModel> episodes = []; // تخزين الحلقات هنا

  EpisodeCubit(this.episodeRepository) : super(EpisodeInitial());

  Future<void> fetchEpisodes() async {
    try {
      emit(EpisodeLoading());
      episodes = await episodeRepository.getEpisodes(); // تعيين الحلقات
      emit(EpisodeLoded(episodes: episodes));
    } catch (e) {
      emit(EpisodeError(message: e.toString()));
    }
  }
}
