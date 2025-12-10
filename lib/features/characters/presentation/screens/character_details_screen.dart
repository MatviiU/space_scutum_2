import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_scutum_2/features/characters/data/repositories/models/character.dart';
import 'package:space_scutum_2/features/episodes/presentation/cubit/episodes_cubit.dart';
import 'package:space_scutum_2/features/episodes/presentation/cubit/episodes_state.dart';

class CharacterDetailsScreen extends StatelessWidget {
  const CharacterDetailsScreen({required this.character, super.key});

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Character Details')),
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
                  Text(character.name),
                  Text(character.status),
                  Text(character.species),
                  Text(character.location),
                ],
              ),
              const Text('Episodes:'),
              BlocBuilder<EpisodesCubit, EpisodesState>(
                builder: (context, state) {
                  return ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      if (state.isLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (state.episodes.isEmpty) {
                        return const Text('No episodes found');
                      }

                      if (state.hasError) {
                        return const Text('Error');
                      }

                      return Text(state.episodes[index].name);
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 8);
                    },
                    itemCount: state.episodes.length,
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
