import 'package:equatable/equatable.dart';
import 'package:space_scutum_2/features/characters/data/repositories/models/character.dart';

class CharactersState extends Equatable {
  const CharactersState({
    required this.characters,
    required this.isLoading,
    required this.isError,
    required this.currentPage,
  });

  CharactersState.initial()
    : this(characters: [], isLoading: false, isError: false, currentPage: 1);

  final List<Character> characters;
  final bool isLoading;
  final bool isError;
  final int currentPage;

  CharactersState copyWith({
    List<Character>? characters,
    bool? isLoading,
    bool? isError,
    int? currentPage,
  }) {
    return CharactersState(
      characters: characters ?? this.characters,
      isLoading: isLoading ?? this.isLoading,
      isError: isError ?? this.isError,
      currentPage: currentPage ?? this.currentPage,
    );
  }

  @override
  List<Object?> get props => [characters, isLoading, isError, currentPage];
}
