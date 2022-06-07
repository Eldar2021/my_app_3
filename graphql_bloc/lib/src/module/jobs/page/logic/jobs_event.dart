part of 'jobs_bloc.dart';

abstract class JobsEvent extends Equatable {}

class JobsFetchEvent extends JobsEvent {
  @override
  List<Object?> get props => [];
}

class CompanyFetchEvent extends JobsEvent {
  @override
  List<Object?> get props => [];
}
