import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:space_scutum_2/di/get_it.dart';
import 'package:space_scutum_2/features/characters/data/repositories/character_repository.dart';
import 'package:space_scutum_2/features/characters/data/repositories/models/character.dart';
import 'package:space_scutum_2/features/characters/presentation/screens/character_details_screen.dart';
import 'package:space_scutum_2/features/characters/presentation/screens/main_page.dart';
import 'package:space_scutum_2/features/episodes/data/repositories/models/episode.dart';
import 'package:space_scutum_2/features/episodes/presentation/cubit/episode_details_cubit.dart';
import 'package:space_scutum_2/features/episodes/presentation/screens/episodes_page.dart';
import 'package:space_scutum_2/router/route_names.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: RouteNames.mainPage,
      builder: (context, state) {
        return const MainPage();
      },
      routes: [
        GoRoute(
          path: 'character-details',
          name: RouteNames.characterDetails,
          builder: (context, state) {
            return CharacterDetailsScreen(character: state.extra! as Character);
          },
          routes: [
            GoRoute(
              path: 'episodes',
              name: RouteNames.episodesPage,
              builder: (context, state) {
                final episode = state.extra! as Episode;
                return BlocProvider(
                  create: (context) =>
                      EpisodeDetailsCubit(getIt<CharacterRepository>())
                        ..getCharactersByIds(episode.characters),
                  child: EpisodesPage(episode: episode),
                );
              },
            ),
          ],
        ),
      ],
    ),
  ],
);
