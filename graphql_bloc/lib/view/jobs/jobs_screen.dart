import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../api/api.dart';
import '../../logic/jobs_bloc.dart';

class JobsScreen extends StatelessWidget {
  const JobsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JobsScreen'),
      ),
      body: Center(
        child: BlocBuilder<JobsBloc, JobsState>(
          builder: (context, state) {
            if (state is JobsLoading) {
              return const CircularProgressIndicator();
            } else if (state is JobsError) {
              return Text("${state.exception}");
            } else if (state is JobsSuccess) {
              return JobsList(state.jobs);
            } else {
              return const Text('Some Error');
            }
          },
        ),
      ),
    );
  }
}

class JobsList extends StatelessWidget {
  const JobsList(this.jobs, {super.key});

  final List<Job> jobs;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: jobs.length,
      itemBuilder: (context, index) {
        final job = jobs[index];
        return Card(
          child: ListTile(
            leading: const Icon(Icons.location_city),
            title: Text(job.title),
            trailing: Icon(
              job.isFeatured == true ? Icons.star : Icons.star_border,
              color: Colors.orangeAccent,
            ),
            subtitle: Text(job.locationNames ?? ''),
          ),
        );
      },
    );
  }
}
