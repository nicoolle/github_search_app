import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ledsdoit/constants/network.dart';
import 'package:ledsdoit/data/repository/favorite_repos_repository.dart';
import 'package:ledsdoit/data/repository/history_repository.dart';
import 'package:ledsdoit/data/services/network_service.dart';

final historyRepositoryProvider = Provider<HistoryRepository>((ref) {
  return HistoryRepository();
});

final favoriteReposRepositoryProvider =
    Provider<FavoriteReposRepository>((ref) {
  return FavoriteReposRepository();
});

final networkServiceProvider = Provider<NetworkService>((ref) {
  return NetworkService(baseURL: NetworkUrl.baseURL);
});
