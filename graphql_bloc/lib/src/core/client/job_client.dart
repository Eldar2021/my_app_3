import 'package:graphql/client.dart';
import '../../src.dart';

class JobApiClient {
  JobApiClient(GraphQLClient client) : _graphQLClient = client;

  final GraphQLClient _graphQLClient;

  factory JobApiClient.create() {
    final link = Link.from([HttpLink('https://api.graphql.jobs')]);
    final cache = GraphQLCache();
    return JobApiClient(GraphQLClient(cache: cache, link: link));
  }

  Future<List<Job>> getJobs() async {
    final options = QueryOptions(document: gql(getJobsStr));
    final res = await _graphQLClient.query(options);
    if (res.hasException) {
      throw GetJobsRequestFailure('${res.exception}');
    } else {
      final data = res.data?['jobs'] as List;
      return data.map((e) => Job.fromJson(e)).toList();
    }
  }
}

class GetJobsRequestFailure implements Exception {
  final String exception;

  GetJobsRequestFailure(this.exception);
}
