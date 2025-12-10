import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_scutum_2/features/characters/presentation/cubits/character_details_state.dart';
import 'package:space_scutum_2/features/episodes/data/repositories/episodes_repository.dart';

class CharacterDetailsCubit extends Cubit<CharacterDetailsState> {
  CharacterDetailsCubit(this._repository)
    : super(CharacterDetailsState.initial());

  final EpisodesRepository _repository;

  Future<void> getEpisodesByIds(List<String> urls) async {
    emit(state.copyWith(isLoading: true));
    try {
      final episodes = await _repository.getEpisodesByIds(urls);
      emit(state.copyWith(episodes: episodes, isLoading: false));
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
