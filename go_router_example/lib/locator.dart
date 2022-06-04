import 'package:get_it/get_it.dart';
import 'package:go_router_example/auth/auth.dart';
import 'package:go_router_example/core/core.dart';
import 'package:hive/hive.dart';

final sl = GetIt.I;

void setup(Box<String> tHive) {
  sl
    ..registerLazySingleton<HiveService>(() => HiveService(Hive))
    ..registerLazySingleton<TokenService>(() => TokenService(tHive))
    ..registerLazySingleton<AuthCubit>(
      () => AuthCubit(sl<TokenService>()),
    );
}
