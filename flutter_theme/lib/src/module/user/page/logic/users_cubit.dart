import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/domain.dart';

part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  UsersCubit(this.repo) : super(UsersInitial());

  final UserRepoSitory repo;

  Future<void> fetch() async {
    final res = await repo.fetchUsers();
    res.fold((l) => emit(UsersError(l)), (r) => emit(UsersSuccess(r)));
  }
}
