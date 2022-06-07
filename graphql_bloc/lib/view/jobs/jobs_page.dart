import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_bloc/api/client/client.dart';
import 'package:graphql_bloc/logic/jobs_bloc.dart';

import 'jobs_screen.dart';

class JobsPage extends StatelessWidget {
  const JobsPage({required this.jobApiClient, super.key});

  final JobApiClient jobApiClient;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => JobsBloc(jobApiClient)..add(JobsFetchEvent()),
      child: const JobsScreen(),
    );
  }
}
