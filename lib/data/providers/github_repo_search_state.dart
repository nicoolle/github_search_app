import 'package:ledsdoit/data/models/github_repository.dart';

class GitHubRepoSearchState {
  final List<GitHubRepository> repositories;
  final List<GitHubRepository> favoriteRepositories;
  final List<String> searchHistory;
  final bool isLoading;

  GitHubRepoSearchState({
    required this.repositories,
    required this.favoriteRepositories,
    required this.searchHistory,
    required this.isLoading,
  });

  factory GitHubRepoSearchState.initial() {
    return GitHubRepoSearchState(
      repositories: [],
      favoriteRepositories: [],
      searchHistory: [],
      isLoading: false,
    );
  }

  GitHubRepoSearchState copyWith({
    List<GitHubRepository>? repositories,
    List<GitHubRepository>? favoriteRepositories,
    List<String>? searchHistory,
    bool? isLoading,
  }) {
    return GitHubRepoSearchState(
      repositories: repositories ?? this.repositories,
      favoriteRepositories: favoriteRepositories ?? this.favoriteRepositories,
      searchHistory: searchHistory ?? this.searchHistory,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}