import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';

import 'fixtures/fixture.dart';

class ApiClient {
  ApiClient(Client client) : _client = client;

  final Client _client;
  String? token;

  Future<Map<String, String>> getHeader() async {
    final headers = <String, String>{
      'Content-Type': 'application/json; charset=utf-8',
      'Accept': 'application/json',
    };
    if (token != null) headers['Authorization'] = 'Bearer $token';

    return headers;
  }

  Future<Either<Exception, T>> responseType<T>(
    Response response,
    T Function(String body) fromJson,
  ) async {
    await Future.delayed(const Duration(seconds: 2));
    if (response.statusCode == 200) {
      try {
        final model = fromJson(response.body);
        return Right(model);
      } catch (e) {
        debugPrint(e.toString());
        throw Exception();
      }
    } else if (response.statusCode == 401) {
      debugPrint('token jok');
      throw Exception();
    } else {
      debugPrint('server kata');
      throw Exception();
    }
  }

  Future<Either<Exception, T>> get<T>(
    String path, {
    Map<String, dynamic>? params,
    required T Function(String body) fromJson,
  }) async {
    _httpClient200(path, params);
    final header = await getHeader();
    final response = await _client.get(
      buildUri(path, params: params),
      headers: header,
    );
    return responseType<T>(response, fromJson);
  }

  Future<Either<Exception, T>> post<T>(
    String path, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? headerParams,
    required T Function(String body) fromJson,
  }) async {
    final header = await getHeader();
    final response = await _client.post(
      buildUri(path, params: headerParams),
      body: jsonEncode(body),
      headers: header,
    );
    return responseType<T>(response, fromJson);
  }

  Future<Either<Exception, T>> patch<T>(
    String path, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? headerParams,
    required T Function(String body) fromJson,
  }) async {
    final header = await getHeader();
    final response = await _client.patch(
      buildUri(path, params: headerParams),
      body: jsonEncode(body),
      headers: header,
    );
    return responseType<T>(response, fromJson);
  }

  Future<Either<Exception, T>> put<T>(
    String path, {
    Map<String, dynamic>? body,
    required T Function(String body) fromJson,
  }) async {
    final header = await getHeader();
    final response = await _client.put(
      buildUri(path),
      body: jsonEncode(body),
      headers: header,
    );
    return responseType<T>(response, fromJson);
  }

  Uri buildUri(String path, {Map<String, dynamic>? params}) {
    final data = Uri.parse(path);
    return data;
  }

  void _httpClient200(String path, Map<String, dynamic>? params) async {
    final header = await getHeader();
    when(
      () => _client.get(buildUri(path, params: params), headers: header),
    ).thenAnswer(
      (_) async => Response(await fixture('get_model'), 200),
    );
  }
}
