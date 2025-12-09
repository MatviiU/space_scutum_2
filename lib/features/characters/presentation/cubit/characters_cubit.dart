import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_scutum_2/features/characters/data/repositories/character_repository.dart';
import 'package:space_scutum_2/features/characters/presentation/cubit/characters_state.dart';

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
      emit(state.copyWith(isError: true, isLoading: false));
    }
  }

  //Incrementing and decrementing page
  void incrementPage() {
    emit(state.copyWith(currentPage: state.currentPage + 1));
  }

  void decrementPage() {
    emit(state.copyWith(currentPage: state.currentPage - 1));
  }
}
