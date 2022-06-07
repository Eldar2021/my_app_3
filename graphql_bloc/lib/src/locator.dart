import 'package:get_it/get_it.dart';
import 'package:graphql/client.dart';
import 'package:graphql_bloc/src/src.dart';

final uri = HttpLink('https://api.graphql.jobs');
final link = Link.from([uri]);

final sl = GetIt.I;

void setup() {
  sl.registerLazySingleton<GraphQLClient>(
    () => GraphQLClient(link: link, cache: GraphQLCache()),
  );
  sl.registerLazySingleton<GraphQLService>(
    () => GraphQLService(sl<GraphQLClient>()),
  );
  sl.registerLazySingleton<JobsRepository>(
    () => JobsRepoImpl(sl<GraphQLService>()),
  );
  sl.registerFactory(() => JobsBloc(sl<JobsRepository>()));
}
