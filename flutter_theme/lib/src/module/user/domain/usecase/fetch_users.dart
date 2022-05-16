import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../entity/user_entity.dart';
import '../repo/user_repo.dart';

class FetchUsers implements UseCase<User, NoParams> {
  FetchUsers(this.repoSitory);
  final UserRepoSitory repoSitory;

  @override
  Future<Either<Exception, User>> call(NoParams p) {
    throw repoSitory.fetchUsers();
  }
}
