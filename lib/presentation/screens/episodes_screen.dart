import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'EpisodeDetailsScreen.dart';
import '../widget/episode_item.dart';
import '../../bussnesLogic/cubit/episode_cubit.dart';
import '../../bussnesLogic/cubit/episode_state.dart';
import '../../constants/colosr.dart';


class EpisodesScreen extends StatelessWidget {
  const EpisodesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Episodes"),
        backgroundColor: myColors.myYelow,
      ),
      backgroundColor: myColors.myGrey,
      body: BlocBuilder<EpisodeCubit, EpisodeState>(
        builder: (context, state) {
          if (state is EpisodeLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is EpisodeLoded) {
            final episodes = state.episodes;
            return ListView.builder(
              itemCount: episodes.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            EpisodeDetailsScreen(episode: episodes[index]),
                      ),
                    );
                  },
                  child: EpisodeItem(episode: episodes[index]),
                );
              },
            );
          } else if (state is EpisodeError) {
            return Center(
              child: Text(
                state.message,
                style: const TextStyle(color: Colors.red, fontSize: 16),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
