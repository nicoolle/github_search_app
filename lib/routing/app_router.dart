import 'package:go_router/go_router.dart';
import 'package:ledsdoit/screens/favorite_screen.dart';
import 'package:ledsdoit/screens/search_screen.dart';

enum AppRoute {
  search,
  favorite,
}

GoRouter goRouter() {
  return GoRouter(
    initialLocation: '/search',
    routes: [
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
