import 'package:dartz/dartz.dart';
import 'package:http_service1/http_service1.dart';

import 'home_data.dart';

class HomeRepo {
  final HttpService httpService;

  const HomeRepo(this.httpService);

  Future<Either<Exception, List<Home>>> getItems() async {
    final res = await httpService.get('', fromJson: homeFromJson);
    print(res);
    return res;
  }
}
