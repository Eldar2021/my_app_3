import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

import '../../module/module.dart';
import '../core.dart';

final sl = GetIt.I;

void setup() {
  sl
    ..registerLazySingleton<Client>(() => Client())
    ..registerLazySingleton<ApiClient>(() => ApiClient(sl<Client>()))

    /// Users
    ..registerFactory<FetchUsersRemote>(
      () => FetchUsersRemoteImpl(sl<ApiClient>()),
    )
    ..registerFactory<UserRepoSitory>(
      () => UserRepoImpl(sl<FetchUsersRemote>()),
    )
    ..registerFactory(
      () => UsersCubit(sl<UserRepoSitory>())..fetch(),
    );
}
