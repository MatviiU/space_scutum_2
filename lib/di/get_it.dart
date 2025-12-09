import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:space_scutum_2/core/network/test_api.dart';
import 'package:space_scutum_2/features/characters/data/data_source/characters_data_source.dart';
import 'package:space_scutum_2/features/characters/data/repositories/character_repository.dart';
import 'package:space_scutum_2/features/characters/presentation/cubit/characters_cubit.dart';

final getIt = GetIt.instance;

Future<void> initDI() async {
  _registerCharactersFeature();

  return getIt.allReady();
}

void _registerCharactersFeature() {
  getIt
    ..registerLazySingleton<Dio>(Dio.new)
    ..registerLazySingleton<TestApi>(() => TestApi(getIt<Dio>()))
    ..registerLazySingleton<CharacterDataSource>(
      () => CharacterDataSourceImpl(getIt<TestApi>()),
    )
    ..registerLazySingleton<CharacterRepository>(
      () => CharacterRepositoryImpl(getIt<CharacterDataSource>()),
    )
    ..registerCachedFactory<CharactersCubit>(
      () => CharactersCubit(getIt<CharacterRepository>()),
    );
}
