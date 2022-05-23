import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:mock_api/client.dart';
import 'package:mock_api/repo.dart';
import 'package:mocktail/mocktail.dart';

class IMockClient extends Mock implements Client {}

final sl = GetIt.I;

void setup() {
  sl
    ..registerLazySingleton<Client>(() => IMockClient())
    ..registerLazySingleton<ApiClient>(
      () => ApiClient(sl<Client>()),
    )
    ..registerFactory<ModelRepository>(
      () => ModelRepoImpl(sl<ApiClient>()),
    );
}
