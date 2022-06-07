import 'package:dartz/dartz.dart';

import '../../../../src.dart';

abstract class JobsRepository {
  Future<Either<Exception, List<Job>>> getJobs();

  Future<Either<Exception, List<Company>>> getCompanies();
}

class JobsRepoImpl implements JobsRepository {
  JobsRepoImpl(this.service);

  final GraphQLService service;

  @override
  Future<Either<Exception, List<Job>>> getJobs() async {
    return service.queryList(getJobsStr, 'jobs', Job.fromJson);
  }
  
  @override
  Future<Either<Exception, List<Company>>> getCompanies() {
    return service.queryList(getCompaniesStr, 'companies', Company.fromJson);
  }
}
