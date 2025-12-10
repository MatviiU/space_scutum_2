import 'package:equatable/equatable.dart';
import 'package:space_scutum_2/features/characters/data/repositories/models/character.dart';

class EpisodeDetailsState extends Equatable {
  const EpisodeDetailsState({
    required this.characters,
    required this.isLoading,
    required this.hasError,
    required this.errorMessage,
  });

  factory EpisodeDetailsState.initial() {
    return const EpisodeDetailsState(
      characters: [],
      isLoading: true,
      hasError: false,
      errorMessage: '',
    );
  }

  final List<Character> characters;
  final bool isLoading;
  final bool hasError;
  final String errorMessage;

  EpisodeDetailsState copyWith({
    List<Character>? characters,
    bool? isLoading,
    bool? hasError,
    String? errorMessage,
  }) {
    return EpisodeDetailsState(
      characters: characters ?? this.characters,
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [characters, isLoading, hasError, errorMessage];
}
