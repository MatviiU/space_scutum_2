import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_scutum_2/features/episodes/data/repositories/models/episode.dart';
import 'package:space_scutum_2/features/episodes/presentation/cubit/episode_details_cubit.dart';
import 'package:space_scutum_2/features/episodes/presentation/cubit/episode_details_state.dart';

class EpisodesPage extends StatelessWidget {
  const EpisodesPage({required this.episode, super.key});

  final Episode episode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Episodes')),
      body: Padding(
        padding: const .symmetric(horizontal: 16, vertical: 8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: .start,
            spacing: 12,
            children: [
              Column(
                crossAxisAlignment: .start,
                children: [
                  Text(episode.name),
                  Text(episode.episode),
                  Text(episode.airDate),
                ],
              ),
              const Text('Characters:'),
              BlocBuilder<EpisodeDetailsCubit, EpisodeDetailsState>(
                builder: (context, state) {
                  if (state.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (state.hasError) {
                    return const Text('Error');
                  }
                  if (state.characters.isEmpty) {
                    return const Text('No characters found');
                  }
                  return ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Text(state.characters[index].name);
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 8);
                    },
                    itemCount: state.characters.length,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
