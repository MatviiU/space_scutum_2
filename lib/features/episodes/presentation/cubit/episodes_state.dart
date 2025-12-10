import 'package:equatable/equatable.dart';
import 'package:space_scutum_2/features/episodes/data/repositories/models/episode.dart';

class EpisodesState extends Equatable {
  const EpisodesState({
    required this.episodes,
    required this.isLoading,
    required this.currentPage,
    required this.hasError,
  });

  factory EpisodesState.initial() {
    return const EpisodesState(
      episodes: [],
      isLoading: true,
      currentPage: 1,
      hasError: false,
    );
  }

  final List<Episode> episodes;
  final bool isLoading;
  final int currentPage;
  final bool hasError;

  EpisodesState copyWith({
    List<Episode>? episodes,
    bool? isLoading,
    int? currentPage,
    bool? hasError,
  }) {
    return EpisodesState(
      episodes: episodes ?? this.episodes,
      isLoading: isLoading ?? this.isLoading,
      currentPage: currentPage ?? this.currentPage,
      hasError: hasError ?? this.hasError,
    );
  }

  @override
  List<Object?> get props => [episodes, isLoading, currentPage, hasError];
}
