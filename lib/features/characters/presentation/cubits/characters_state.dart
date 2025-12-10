import 'package:equatable/equatable.dart';
import 'package:space_scutum_2/features/characters/data/repositories/models/character.dart';

class CharactersState extends Equatable {
  const CharactersState({
    required this.characters,
    required this.isLoading,
    required this.isError,
    required this.currentPage,
    required this.errorMessage,
  });

  CharactersState.initial()
    : this(
        characters: [],
        isLoading: false,
        isError: false,
        currentPage: 1,
        errorMessage: '',
      );

  final List<Character> characters;
  final bool isLoading;
  final bool isError;
  final String errorMessage;
  final int currentPage;

  CharactersState copyWith({
    List<Character>? characters,
    bool? isLoading,
    bool? isError,
    String? errorMessage,
    int? currentPage,
  }) {
    return CharactersState(
      characters: characters ?? this.characters,
      isLoading: isLoading ?? this.isLoading,
      isError: isError ?? this.isError,
      errorMessage: errorMessage ?? this.errorMessage,
      currentPage: currentPage ?? this.currentPage,
    );
  }

  @override
  List<Object?> get props => [
    characters,
    isLoading,
    isError,
    errorMessage,
    currentPage,
  ];
}
