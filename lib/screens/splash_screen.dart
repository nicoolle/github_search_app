import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ledsdoit/constants/app_colors.dart';
import 'package:ledsdoit/constants/app_sizes.dart';
import 'package:ledsdoit/data/providers/github_repo_search_notifier.dart';
import 'package:ledsdoit/routing/app_router.dart';
import 'package:ledsdoit/widgets/loader.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(githubRepoSearchProvider);
    Future.delayed(const Duration(milliseconds: 1500), () {
      context.pushReplacementNamed(AppRoute.search.name);
    });
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            color: AppColors.blue,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Search App',
                    style: TextStyle(color: AppColors.white, fontSize: 16)),
                gapH8,
                Loader(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
