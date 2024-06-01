import 'package:shared_preferences/shared_preferences.dart';

const _keySearchHistory = 'searchHistory';

class HistoryRepository {
  Future<List<String>> searchHistory() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_keySearchHistory) ?? [];
  }

  Future<Future<bool>> saveSearchHistory(List<String> searchHistory) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setStringList(_keySearchHistory, searchHistory);
  }

  Future<bool> clearSearchHistory() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(_keySearchHistory);
  }
}
