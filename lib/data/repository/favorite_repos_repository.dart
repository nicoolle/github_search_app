
import 'package:shared_preferences/shared_preferences.dart';

const _keyFavoriteRepos = 'favorites';

class FavoriteReposRepository {
  Future<List<String>> favoriteRepos() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_keyFavoriteRepos) ?? [];
  }

  Future<Future<bool>> saveFavoriteRepos(List<String> favoriteRepos) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setStringList(_keyFavoriteRepos, favoriteRepos);
  }

  Future<bool> clearFavoriteRepos() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(_keyFavoriteRepos);
  }
}
