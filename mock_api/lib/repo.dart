import 'package:dartz/dartz.dart';
import 'package:mock_api/client.dart';
import 'package:mock_api/model.dart';

abstract class ModelRepository {
  Future<Either<Exception, Model>> getModel();
}

class ModelRepoImpl implements ModelRepository {
  final ApiClient client;

  ModelRepoImpl(this.client);

  @override
  Future<Either<Exception, Model>> getModel() async {
    final res = await client.get<Model>('path', fromJson: modelFromJson);

    return res;
  }
}
