import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../../domain/entity/user_entity.dart';

abstract class FetchUsersRemote {
  Future<Either<Exception, User>> fetchUsers();
}

class FetchUsersRemoteImpl implements FetchUsersRemote {
  FetchUsersRemoteImpl(this.client);

  final ApiClient client;

  @override
  Future<Either<Exception, User>> fetchUsers() async {
    final res = await client.get<User>(
      ApiConst.instance.users,
      fromJson: userFromJson,
    );

    return res.fold((l) => Left(l), (r) => Right(r));
  }
}
