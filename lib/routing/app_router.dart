import 'package:go_router/go_router.dart';
import 'package:ledsdoit/screens/favorite_screen.dart';
import 'package:ledsdoit/screens/search_screen.dart';
import 'package:ledsdoit/screens/splash_screen.dart';

enum AppRoute {
  splash,
  search,
  favorite,
}

GoRouter goRouter() {
  return GoRouter(
    initialLocation: '/splash',
    routes: [
      GoRoute(
        path: '/splash',
        name: AppRoute.splash.name,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/search',
        name: AppRoute.search.name,
        builder: (context, state) => const SearchScreen(),
        routes: [
          GoRoute(
            path: 'favorite',
            name: AppRoute.favorite.name,
            builder: (context, state) => const FavoriteScreen(),
          )
        ],
      )
    ],
  );
}
