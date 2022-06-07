import 'package:dartz/dartz.dart';
import 'package:graphql/client.dart';

class GraphQLService {
  GraphQLService(GraphQLClient client) : _graphQLClient = client;

  final GraphQLClient _graphQLClient;

  // factory JobApiClient.create() {
  //   final link = Link.from([HttpLink('https://api.graphql.jobs')]);
  //   final cache = GraphQLCache();
  //   return JobApiClient(GraphQLClient(cache: cache, link: link));
  // }

  Future<Either<Exception, T>> query<T>(
    String query,
    String type,
    T Function(Map<String, dynamic> body) fromJson,
  ) async {
    final options = QueryOptions(document: gql(query));
    final res = await _graphQLClient.query(options);
    if (res.hasException) {
      return Left(GetJobsRequestFailure('${res.exception}'));
    } else {
      final data = res.data?[type];
      return Right(fromJson(data));
    }
  }

  Future<Either<Exception, List<T>>> queryList<T>(
    String query,
    String type,
    T Function(Map<String, dynamic> body) fromJson,
  ) async {
    final options = QueryOptions(document: gql(query));
    final res = await _graphQLClient.query(options);
    if (res.hasException) {
      return Left(GetJobsRequestFailure('${res.exception}'));
    } else {
      final data = res.data?[type] as List;
      return Right(data.map((e) => fromJson(e)).toList());
    }
  }
}

class GetJobsRequestFailure implements Exception {
  final String exception;

  GetJobsRequestFailure(this.exception);
}
