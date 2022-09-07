import 'package:get_it/get_it.dart';
import 'package:halian/config/router/my_router.dart';
import 'package:halian/data/repository/remote_repository_impl.dart';

import '../data/repository/remote_repository.dart';
import '../services/seat_geek_service.dart';

GetIt locator = GetIt.I;

setUpLocators() {
  locator.registerLazySingleton<MyRouter>(() => MyRouter());
  locator.registerLazySingleton<RemoteRepository>(() => RemoteRepositoryImpl());
  locator.registerLazySingleton<SeatGeekService>(() => SeatGeekService());
}