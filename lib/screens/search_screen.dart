import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:ledsdoit/routing/app_router.dart';
import 'package:ledsdoit/widgets/loader.dart';
import 'package:ledsdoit/constants/app_colors.dart';
import 'package:ledsdoit/constants/app_sizes.dart';
import 'package:ledsdoit/data/providers/github_repo_search_notifier.dart';
import 'package:ledsdoit/widgets/button_widget.dart';
import 'package:ledsdoit/widgets/search/search_field.dart';
import 'package:ledsdoit/widgets/search/search_history_widget.dart';
import 'package:ledsdoit/widgets/search/search_result_repos_widget.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final searchState = ref.watch(githubRepoSearchProvider);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title:
              const Text('GitHub repos list', style: TextStyle(fontSize: 18)),
          actions: [
            ButtonWidget(
              onTap: () => context.pushNamed(AppRoute.favorite.name),
              icon: SvgPicture.asset(
                'assets/icons/favorite_icon.svg',
                fit: BoxFit.scaleDown,
                colorFilter: const ColorFilter.mode(
                  AppColors.white,
                  BlendMode.srcIn,
                ),
              ),
            ),
            gapW16
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              gapH16,
              // TextField(
              //   controller: _searchController,
              //   decoration: InputDecoration(
              //     hintText: 'Search',
              //     prefixIcon: const Icon(Icons.search),
              //     fillColor: _focusNode.hasFocus
              //         ? AppColors.blueLight
              //         : AppColors.greyLayer,
              //   ),
              //   style: const TextStyle(fontSize: 18),
              //   onSubmitted: (query) {
              //     if (query.isNotEmpty) {
              //       ref
              //           .read(githubRepoSearchProvider.notifier)
              //           .searchRepositories(_searchController.text);
              //     } else {}
              //   },
              // ),
              SearchField(
                  focusNode: _focusNode,
                  onSearch: (query) {
                    if (query.isNotEmpty) {
                      ref
                          .read(githubRepoSearchProvider.notifier)
                          .searchRepositories(_searchController.text);
                    } else {}
                  },
                  controller: _searchController),
              searchState.isLoading
                  ? const Loader()
                  : _searchController.value.text != ''
                      ? SearchResultReposWidget(
                          githubRepositoriesList: searchState.repositories)
                      : SearchHistoryWidget(
                          searchHistoryList: searchState.searchHistory)
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }
}
