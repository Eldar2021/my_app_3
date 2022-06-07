import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../api/api.dart';

part 'jobs_event.dart';
part 'jobs_state.dart';

class JobsBloc extends Bloc<JobsEvent, JobsState> {
  JobsBloc(this.client) : super(JobsLoading()) {
    on<JobsFetchEvent>(_onJobsFetch);
  }

  final JobApiClient client;

  Future<void> _onJobsFetch(
    JobsFetchEvent event,
    Emitter<JobsState> emit,
  ) async {
    try {
      final jobs = await client.getJobs();
      emit(JobsSuccess(jobs));
    } catch (e) {
      emit(JobsError(e));
    }
  }
}
