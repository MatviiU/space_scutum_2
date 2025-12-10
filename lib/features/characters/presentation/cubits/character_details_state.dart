import 'package:equatable/equatable.dart';
import 'package:space_scutum_2/features/episodes/data/repositories/models/episode.dart';

class CharacterDetailsState extends Equatable {
  const CharacterDetailsState({
    required this.episodes,
    required this.isLoading,
    required this.hasError,
    required this.errorMessage,
  });

  factory CharacterDetailsState.initial() {
    return const CharacterDetailsState(
      episodes: [],
      isLoading: true,
      hasError: false,
      errorMessage: '',
    );
  }

  final List<Episode> episodes;
  final bool isLoading;
  final bool hasError;
  final String errorMessage;

  CharacterDetailsState copyWith({
    List<Episode>? episodes,
    bool? isLoading,
    bool? hasError,
    String? errorMessage,
  }) {
    return CharacterDetailsState(
      episodes: episodes ?? this.episodes,
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [episodes, isLoading, hasError, errorMessage];
}
