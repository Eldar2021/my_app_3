part of 'jobs_bloc.dart';

abstract class JobsState extends Equatable {}

class JobsLoading extends JobsState {
  @override
  List<Object?> get props => [];
}

class JobsSuccess extends JobsState {
  JobsSuccess(this.jobs);

  final List<Job> jobs;

  @override
  List<Object?> get props => [jobs];
}

class CompanySuccess extends JobsState {
  CompanySuccess(this.companies);

  final List<Company> companies;

  @override
  List<Object?> get props => [companies];
}

class JobsError extends JobsState {
  JobsError(this.exception);

  final Object exception;

  @override
  List<Object?> get props => [exception];
}
