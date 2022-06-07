import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../src.dart';

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
            } else if (state is CompanySuccess) {
              return CompanyList(state.companies);
            } else {
              return const Text('Some Error');
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<JobsBloc>().add(CompanyFetchEvent());
        },
        child: const Icon(Icons.ac_unit),
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

class CompanyList extends StatelessWidget {
  const CompanyList(this.companies, {super.key});

  final List<Company> companies;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: companies.length,
      itemBuilder: (context, index) {
        final company = companies[index];
        return Card(
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                company.logoUrl ?? 'https://picsum.photos/200/300',
              ),
            ),
            title: Text(company.name),
            subtitle: Text(company.websiteUrl ?? ''),
          ),
        );
      },
    );
  }
}
