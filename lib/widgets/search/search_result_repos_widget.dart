import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ledsdoit/constants/messages.dart';
import 'package:ledsdoit/widgets/empty_data_message_widget.dart';
import 'package:ledsdoit/widgets/repository_tile_widget.dart';
import 'package:ledsdoit/constants/app_sizes.dart';
import 'package:ledsdoit/data/providers/github_repo_search_notifier.dart';
import 'package:ledsdoit/data/models/github_repository.dart';

class SearchResultReposWidget extends ConsumerWidget {
  final List<GitHubRepository> githubRepositoriesList;

  const SearchResultReposWidget(
      {super.key, required this.githubRepositoriesList});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: githubRepositoriesList.isEmpty
          ? const EmptyDataMessageWidget(
              message: EmptyDataMessages.emptySearch,
            )
          : ListView.builder(
              itemCount: githubRepositoriesList.length,
              itemBuilder: (context, index) {
                final repository = githubRepositoriesList[index];
                final isFavorite = ref
                    .read(githubRepoSearchProvider.notifier)
                    .isFavorite(repository);

                return Column(
                  children: [
                    RepositoryTileWidget(
                        onPressed: () => ref
                            .read(githubRepoSearchProvider.notifier)
                            .toggleFavorite(repository),
                        repositoryName: repository.name,
                        isFavorite: isFavorite),
                    gapH8,
                  ],
                );
              }),
    );
  }
}
