import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_scutum_2/features/characters/data/repositories/character_repository.dart';
import 'package:space_scutum_2/features/episodes/presentation/cubit/episode_details_state.dart';

class EpisodeDetailsCubit extends Cubit<EpisodeDetailsState> {
  EpisodeDetailsCubit(this._repository) : super(EpisodeDetailsState.initial());

  final CharacterRepository _repository;

  Future<void> getCharactersByIds(List<String> urls) async {
    emit(state.copyWith(isLoading: true));
    try {
      final characters = await _repository.getCharactersByIds(urls);
      emit(state.copyWith(characters: characters, isLoading: false));
    } catch (e) {
      emit(
        state.copyWith(
          hasError: true,
          isLoading: false,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
