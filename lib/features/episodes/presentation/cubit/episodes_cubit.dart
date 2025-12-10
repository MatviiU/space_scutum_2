import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_scutum_2/features/episodes/data/repositories/episodes_repository.dart';
import 'package:space_scutum_2/features/episodes/presentation/cubit/episodes_state.dart';

class EpisodesCubit extends Cubit<EpisodesState> {
  EpisodesCubit(this._repository) : super(EpisodesState.initial());

  final EpisodesRepository _repository;

  Future<void> getEpisodes() async {
    emit(state.copyWith(isLoading: true));

    try {
      final episodes = await _repository.getEpisodes(state.currentPage);
      emit(state.copyWith(episodes: episodes, isLoading: false));
    } catch (e) {
      emit(state.copyWith(hasError: true, isLoading: false));
    }
  }

  Future<void> getEpisodesByIds(List<String> urls) async {
    emit(state.copyWith(isLoading: true));
    try {
      final episodes = await _repository.getEpisodesByIds(urls);
      emit(state.copyWith(episodes: episodes, isLoading: false));
    } catch (e) {
      emit(state.copyWith(hasError: true, isLoading: false));
    }
  }

  void incrementPage() {
    emit(state.copyWith(currentPage: state.currentPage + 1));
  }

  void decrementPage() {
    emit(state.copyWith(currentPage: state.currentPage - 1));
  }
}
