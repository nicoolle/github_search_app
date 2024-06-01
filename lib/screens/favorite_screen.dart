import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ledsdoit/constants/app_colors.dart';
import 'package:ledsdoit/constants/messages.dart';
import 'package:ledsdoit/widgets/button_widget.dart';
import 'package:ledsdoit/widgets/empty_data_message_widget.dart';
import 'package:ledsdoit/constants/app_sizes.dart';
import 'package:ledsdoit/data/providers/github_repo_search_notifier.dart';
import 'package:ledsdoit/widgets/repository_tile_widget.dart';

class FavoriteScreen extends ConsumerStatefulWidget {
  const FavoriteScreen({super.key});

  @override
  ConsumerState<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends ConsumerState<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(githubRepoSearchProvider);

    return Scaffold(
      appBar: AppBar(
          title: const Text('Favorites'),
          leading: Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 0, 8),
              child: ButtonWidget(
                  onTap: () => context.pop(),
                  icon: const Icon(
                    Icons.arrow_back_ios_new_outlined,
                    color: AppColors.white,
                  )))),
      body: SafeArea(
        child: state.favoriteRepositories.isEmpty
            ? const EmptyDataMessageWidget(
                message: EmptyDataMessages.emptyFavorites,
              )
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView.builder(
                    itemCount: state.favoriteRepositories.length,
                    itemBuilder: (context, index) {
                      final repository = state.favoriteRepositories[index];
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
              ),
      ),
    );
  }
}
