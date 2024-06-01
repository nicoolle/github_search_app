import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ledsdoit/constants/messages.dart';
import 'package:ledsdoit/widgets/empty_data_message_widget.dart';
import 'package:ledsdoit/widgets/repository_tile_widget.dart';
import 'package:ledsdoit/constants/app_sizes.dart';
import 'package:ledsdoit/data/providers/github_repo_search_notifier.dart';
import 'package:ledsdoit/data/models/github_repository.dart';

class SearchResultReposWidget extends ConsumerStatefulWidget {
  final List<GitHubRepository> githubRepositoriesList;
  final TextEditingController controller;

  const SearchResultReposWidget(
      {super.key,
      required this.githubRepositoriesList,
      required this.controller});

  @override
  ConsumerState<SearchResultReposWidget> createState() =>
      _SearchResultReposWidgetState();
}

class _SearchResultReposWidgetState
    extends ConsumerState<SearchResultReposWidget> {

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: widget.githubRepositoriesList.isEmpty
          ? const EmptyDataMessageWidget(
              message: EmptyDataMessages.emptySearch,
            )
          : ListView.builder(
              itemCount: widget.githubRepositoriesList.length,
              itemBuilder: (context, index) {
                final repository = widget.githubRepositoriesList[index];
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
