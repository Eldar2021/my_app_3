class ConvertException implements Exception {
  ConvertException(this.massage);
  final String? massage;

  @override
  String toString() {
    return massage ?? '';
  }
}
