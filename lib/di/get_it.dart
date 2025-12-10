import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:space_scutum_2/core/network/test_api.dart';
import 'package:space_scutum_2/features/characters/data/data_source/characters_data_source.dart';
import 'package:space_scutum_2/features/characters/data/repositories/character_repository.dart';
import 'package:space_scutum_2/features/characters/presentation/cubit/characters_cubit.dart';
import 'package:space_scutum_2/features/episodes/data/data_source/episodes_data_source.dart';
import 'package:space_scutum_2/features/episodes/data/repositories/episodes_repository.dart';
import 'package:space_scutum_2/features/episodes/presentation/cubit/episodes_cubit.dart';

final getIt = GetIt.instance;

Future<void> initDI() async {
  getIt
    ..registerLazySingleton<Dio>(Dio.new)
    ..registerLazySingleton<TestApi>(() => TestApi(getIt<Dio>()));

  _registerCharactersFeature();
  _registerEpisodesFeature();

  return getIt.allReady();
}

void _registerCharactersFeature() {
  getIt
    ..registerLazySingleton<CharacterDataSource>(
      () => CharacterDataSourceImpl(getIt<TestApi>()),
    )
    ..registerLazySingleton<CharacterRepository>(
      () => CharacterRepositoryImpl(getIt<CharacterDataSource>()),
    )
    ..registerFactory<CharactersCubit>(
      () => CharactersCubit(getIt<CharacterRepository>()),
    );
}

void _registerEpisodesFeature() {
  getIt
    ..registerLazySingleton<EpisodesDataSource>(
      () => EpisodesDataSourceImpl(getIt<TestApi>()),
    )
    ..registerLazySingleton<EpisodesRepository>(
      () => EpisodesRepositoryImpl(getIt<EpisodesDataSource>()),
    )
    ..registerFactory<EpisodesCubit>(
      () => EpisodesCubit(getIt<EpisodesRepository>()),
    );
}
