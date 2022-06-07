import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../src.dart';

part 'jobs_event.dart';
part 'jobs_state.dart';

class JobsBloc extends Bloc<JobsEvent, JobsState> {
  JobsBloc(this.repo) : super(JobsLoading()) {
    on<JobsFetchEvent>(_onJobsFetch);
    on<CompanyFetchEvent>(_onCompaniesFetch);
  }

  final JobsRepository repo;

  Future<void> _onJobsFetch(
    JobsFetchEvent event,
    Emitter<JobsState> emit,
  ) async {
    emit(JobsLoading());
    final res = await repo.getJobs();

    res.fold((l) => emit(JobsError(l)), (r) => emit(JobsSuccess(r)));
  }

  Future<void> _onCompaniesFetch(
    CompanyFetchEvent event,
    Emitter<JobsState> emit,
  ) async {
    emit(JobsLoading());
    final res = await repo.getCompanies();

    res.fold((l) => emit(JobsError(l)), (r) => emit(CompanySuccess(r)));
  }
}
