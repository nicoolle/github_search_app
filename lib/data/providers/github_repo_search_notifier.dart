import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ledsdoit/constants/messages.dart';
import 'package:ledsdoit/data/providers/providers.dart';
import 'package:ledsdoit/data/repository/favorite_repos_repository.dart';
import 'package:ledsdoit/data/repository/history_repository.dart';
import 'package:ledsdoit/data/services/network_service.dart';
import 'dart:convert';
import '../models/github_repository.dart';
import 'github_repo_search_state.dart';

class GitHubRepoSearchNotifier extends StateNotifier<GitHubRepoSearchState> {
  final HistoryRepository _historyRepository;
  final FavoriteReposRepository _favoriteReposRepository;
  final NetworkService _networkService;

  GitHubRepoSearchNotifier(
    this._historyRepository,
    this._favoriteReposRepository,
    this._networkService,
  ) : super(GitHubRepoSearchState.initial()) {
    _loadFavorites();
    _loadSearchHistory();
  }

  Future<void> _loadFavorites() async {
    final favoriteJsonList = await _favoriteReposRepository.favoriteRepos();
    final favoriteRepositories = favoriteJsonList.map((item) {
      final json = jsonDecode(item);
      return GitHubRepository.fromJson(json);
    }).toList();

    state = state.copyWith(favoriteRepositories: favoriteRepositories);
  }

  Future<void> _loadSearchHistory() async {
    final searchHistory = await _historyRepository.searchHistory();
    state = state.copyWith(searchHistory: searchHistory);
  }

  Future<void> searchRepositories(String query) async {
    state = state.copyWith(isLoading: true);

    try {
      final data =
          await _networkService.get('repositories?q=$query&per_page=15');
      final List<GitHubRepository> repositories = (data['items'] as List)
          .map((item) => GitHubRepository.fromJson(item))
          .toList();
      state = state.copyWith(repositories: repositories, isLoading: false);
      _saveSearchQuery(query);
    } catch (e) {
      state = state.copyWith(isLoading: false);
      throw Exception(ErrorMessages.failedToLoadRepositories);
    }
  }

  Future<void> _saveSearchQuery(String query) async {
    final searchHistory = await _historyRepository.searchHistory();

    if (!searchHistory.contains(query)) {
      searchHistory.insert(0, query);
      if (searchHistory.length > 10) {
        searchHistory.removeLast();
      }

      state = state.copyWith(searchHistory: searchHistory);
      await _historyRepository.saveSearchHistory(searchHistory);
    }
  }

  Future<void> toggleFavorite(GitHubRepository repository) async {
    final updatedFavorites = [...state.favoriteRepositories];
    if (updatedFavorites.contains(repository)) {
      updatedFavorites.remove(repository);
    } else {
      updatedFavorites.add(repository);
    }

    state = state.copyWith(favoriteRepositories: updatedFavorites);

    final favoriteJsonList =
        updatedFavorites.map((repo) => jsonEncode(repo.toJson())).toList();
    _favoriteReposRepository.saveFavoriteRepos(favoriteJsonList);
  }

  bool isFavorite(GitHubRepository repository) {
    return state.favoriteRepositories.contains(repository);
  }
}

final githubRepoSearchProvider =
    StateNotifierProvider<GitHubRepoSearchNotifier, GitHubRepoSearchState>(
        (ref) {
  final historyRepository = ref.read(historyRepositoryProvider);
  final favoriteReposRepository = ref.read(favoriteReposRepositoryProvider);
  final networkService = ref.read(networkServiceProvider);

  return GitHubRepoSearchNotifier(
      historyRepository, favoriteReposRepository, networkService);
});
