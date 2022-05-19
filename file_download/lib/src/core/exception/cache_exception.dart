class CacheException implements Exception {
  CacheException(this.massage);
  final String massage;

  @override
  String toString() {
    return massage;
  }
}
