import 'package:hive/hive.dart';

const String userUidBox = 'userUidBox';
const String userUidKey = 'userUidKey';

class HiveService {
  HiveService(this.hive);

  final HiveInterface hive;

  Future<void> save<T>({
    required String boxName,
    required String key,
    required T value,
  }) async {
    try {
      final box = await hive.openBox<T>(boxName);
      await box.put(key, value);
      await box.close();
    } catch (e) {
      throw CacheException(message: 'hive service save error $e');
    }
  }

  Future<T?> read<T>({
    required String boxName,
    required String key,
  }) async {
    try {
      final box = await hive.openBox<T>(boxName);
      final val = box.get(key);
      await box.close();
      return val;
    } catch (e) {
      throw CacheException(message: 'hive service read error $e');
    }
  }

  Future<void> clear<T>(String boxName) async {
    try {
      final box = await hive.openBox<T>(boxName);
      await box.clear();
      await box.close();
    } catch (e) {
      throw CacheException(message: 'hive service clear error $e');
    }
  }
}

class TokenService {
  TokenService(this.tHive);

  final Box<String> tHive;

  Future<void> save(String value) async {
    try {
      await tHive.put(userUidKey, value);
    } catch (e) {
      throw CacheException(message: 'hive service save error $e');
    }
  }

  String? get read {
    try {
      return tHive.get(userUidKey);
    } catch (e) {
      throw CacheException(message: 'hive service read error $e');
    }
  }

  Future<void> clear(String boxName) async {
    try {
      await tHive.clear();
    } catch (e) {
      throw CacheException(message: 'hive service clear error $e');
    }
  }
}

class CacheException implements Exception {
  CacheException({this.message});
  final String? message;

  @override
  String toString() {
    return message ?? '';
  }
}