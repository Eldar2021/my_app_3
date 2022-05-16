import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../src.dart';

class UsersList extends StatelessWidget {
  const UsersList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersCubit, UsersState>(
      builder: (context, state) {
        if (state is UsersInitial) {
          return const Load();
        } else if (state is UsersSuccess) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.user.data.length,
            itemBuilder: (context, index) {
              return UserListCard(state.user.data[index]);
            },
          );
        } else if (state is UsersError) {
          return Error(massage: state.exception.toString());
        } else {
          return const Center();
        }
      },
    );
  }
}

class UserListCard extends Card {
  const UserListCard(this.datum, {super.key});

  final Datum datum;

  @override
  Widget? get child => ListTile(
        title: Text(datum.firstName),
        subtitle: Text(datum.email),
        leading: CircleAvatar(backgroundImage: NetworkImage(datum.avatar)),
      );
}
