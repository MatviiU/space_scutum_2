import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_scutum_2/features/characters/data/repositories/character_repository.dart';
import 'package:space_scutum_2/features/characters/presentation/cubits/characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  CharactersCubit(this._repository) : super(CharactersState.initial());

  final CharacterRepository _repository;

  //Getting characters from repository
  Future<void> getCharacters() async {
    emit(state.copyWith(isLoading: true));
    try {
      final characters = await _repository.getCharacters(state.currentPage);
      emit(state.copyWith(characters: characters, isLoading: false));
    } catch (e) {
      emit(
        state.copyWith(
          isError: true,
          isLoading: false,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> getCharactersByIds(List<String> urls) async {
    emit(state.copyWith(isLoading: true));
    try {
      final characters = await _repository.getCharactersByIds(urls);
      emit(state.copyWith(characters: characters, isLoading: false));
    } catch (e) {
      emit(
        state.copyWith(
          isError: true,
          isLoading: false,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  //Incrementing and decrementing page
  void incrementPage() {
    if (state.currentPage == 42) return;
    emit(state.copyWith(currentPage: state.currentPage + 1));
  }

  void decrementPage() {
    if (state.currentPage == 1) return;
    emit(state.copyWith(currentPage: state.currentPage - 1));
  }
}
