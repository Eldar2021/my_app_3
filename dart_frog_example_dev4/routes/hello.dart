import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

Response onRequest(RequestContext context) {
  final header = {'Content-type': 'application/json; charset=utf-8'};
  return Response(body: fixture('user'), headers: header);
}

String fixture(String name) => File('json/$name.json').readAsStringSync();
