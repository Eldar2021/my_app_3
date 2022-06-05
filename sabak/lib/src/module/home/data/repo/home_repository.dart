import 'package:dartz/dartz.dart';
import 'package:http_service1/http_service1.dart';
import 'package:sabak/src/module/home/home.dart';

abstract class HomeRepository {
  Future<Either<Exception, List<Post>>> getPosts();
  Future<Either<Exception, Post>> getPost(String id);
}

class HomeRepoImpl implements HomeRepository {
  HomeRepoImpl(this.service);

  final HttpService service;

  @override
  Future<Either<Exception, List<Post>>> getPosts() async {
    final res = service.get<List<Post>>('', fromJson: postFromJson);
    print(res);
    return res;
  }

  @override
  Future<Either<Exception, Post>> getPost(String id) {
    throw UnimplementedError();
  }
}
