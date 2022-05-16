import 'package:dartz/dartz.dart';

import '../../domain/entity/user_entity.dart';
import '../../domain/repo/user_repo.dart';
import '../source/fetch_users_remote.dart';

class UserRepoImpl implements UserRepoSitory {
  UserRepoImpl(this.remote);
  final FetchUsersRemote remote;

  @override
  Future<Either<Exception, User>> fetchUsers() async {
    return await remote.fetchUsers();
  }
}
