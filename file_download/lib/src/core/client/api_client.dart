// import 'dart:convert';

// import 'package:dartz/dartz.dart';
// import 'package:http/http.dart';

// import '../core.dart';

// class ApiClient {
//   ApiClient(
//     Client client,
//     // required this.cacheToken,
//   ) : _client = client;

//   final Client _client;
//   // final CacheToken cacheToken;
//   // String? token;

//   // Future<Map<String, String>>? getHeader() async {
//   //   // token ??= await cacheToken.readToken();
//   //   final headers = <String, String>{
//   //     'Content-Type': 'application/json',
//   //     'Accept': 'application/json',
//   //   };
//   //   //if (token != null) headers['Authorization'] = 'Bearer $token';

//   //   return headers;
//   // }

//   Future<Either<Exception, T>> responseType<T>(
//     Response response,
//     T Function(String body) fromJson,
//   ) async {
//     if (response.statusCode == 200) {
//       try {
//         final model = fromJson(response.body);
//         return Right(model);
//       } catch (e) {
//         return Left(ConvertException(e.toString()));
//       }
//     }
//     // else if (response.statusCode == 401) {
//     //   throw ATokenException(massage: 'access token bitti');
//     // }
//     else {
//       return Left(ServerException(response.reasonPhrase));
//     }
//   }

//   Future<Either<Exception, T>> get<T>(
//     String path, {
//     Map<String, dynamic>? params,
//     required T Function(String body) fromJson,
//   }) async {
//     // final header = await getHeader();
//     final response = await _client.get(
//       buildUri(path, params: params),
//       // headers: header,
//     );
//     return responseType<T>(response, fromJson);
//   }

//   Future<Either<Exception, T>> post<T>(
//     String path, {
//     Map<String, dynamic>? body,
//     Map<String, dynamic>? headerParams,
//     required T Function(String body) fromJson,
//   }) async {
//     // final header = await getHeader();
//     final response = await _client.post(
//       buildUri(path, params: headerParams),
//       body: jsonEncode(body),
//       // headers: header,
//     );
//     return responseType<T>(response, fromJson);
//   }

//   Future<Either<Exception, T>> patch<T>(
//     String path, {
//     Map<String, dynamic>? body,
//     Map<String, dynamic>? headerParams,
//     required T Function(String body) fromJson,
//   }) async {
//     // final header = await getHeader();
//     final response = await _client.patch(
//       buildUri(path, params: headerParams),
//       body: jsonEncode(body),
//       // headers: header,
//     );
//     return responseType<T>(response, fromJson);
//   }

//   Future<Either<Exception, T>> put<T>(
//     String path, {
//     Map<String, dynamic>? body,
//     required T Function(String body) fromJson,
//   }) async {
//     // final header = await getHeader();
//     final response = await _client.put(
//       buildUri(path),
//       body: jsonEncode(body),
//       // headers: header,
//     );
//     return responseType<T>(response, fromJson);
//   }

//   Uri buildUri(String path, {Map<String, dynamic>? params}) {
//     // final data = Uri(
//     //   scheme: ApiConst.instance.scheme,
//     //   host: ApiConst.instance.host,
//     //   // port: ApiConst.instance.port,
//     //   path: path,
//     //   queryParameters: params,
//     // );
//     // return data;
//     return Uri.parse('https://reqres.in/api/users?page=1');
//   }
// }
