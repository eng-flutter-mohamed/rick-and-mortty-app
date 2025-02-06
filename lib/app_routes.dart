import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bussnesLogic/cubit/episode_cubit.dart';
import 'data/models/Chracters.dart';
import 'data/models/Episodes.dart';
import 'data/repository/EpisodeRepository.dart';
import 'presentation/screens/characterDetilsScreen.dart';
import 'presentation/screens/episodes_screen.dart';
import 'package:rickapp/presentation/widget/episode_item.dart';
import 'bussnesLogic/cubit/characers_cubit.dart';
import 'constants/strings.dart';
import 'data/repository/chractersRepository.dart';
import 'data/webServices/ChractersWebServices.dart';
import 'presentation/screens/characters_screen.dart';

class AppRoutes {
  late CharactersRepository charactersRepository;
  late CharactersCubit charactersCubit;
  late EpisodeCubit episodeCubit;
  late EpisodeRepository episodeRepository;

  AppRoutes() {
    // تهيئة Dio
    Dio dio = Dio(
      BaseOptions(
        baseUrl: "https://rickandmortyapi.com/api/episode",
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    );

    // تهيئة الكائنات قبل استخدامها
    charactersRepository =
        CharactersRepository(charactersWebServices: CharactersWebServices());
    charactersCubit = CharactersCubit(charactersRepository);

    // تهيئة EpisodeRepository وتمرير Dio
    episodeRepository = EpisodeRepository(dio: dio);
    episodeCubit = EpisodeCubit(episodeRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case allcharacterRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => charactersCubit,
            child: const CharactersScreen(),
          ),
        );
      case characterdetilisScreen:
        final character = settings.arguments as CharacterModel;
        return MaterialPageRoute(
          builder: (_) => Characterdetilsscreen(character: character),
        );
      case episodesScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => episodeCubit,
            child: const EpisodesScreen(),
          ),
        );
      case episodeItemScreen:
        final episode = settings.arguments as EpisodesModel;
        return MaterialPageRoute(
          builder: (_) => EpisodeItem(episode: episode),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text("Page not found!"),
            ),
          ),
        );
    }
  }
}
