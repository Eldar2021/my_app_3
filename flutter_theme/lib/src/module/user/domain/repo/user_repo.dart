import 'package:dartz/dartz.dart';

import '../entity/user_entity.dart';

abstract class UserRepoSitory {
  Future<Either<Exception, User>> fetchUsers();
}
