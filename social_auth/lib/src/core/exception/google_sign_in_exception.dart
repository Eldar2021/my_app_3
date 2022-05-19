class GoogleSignInExc implements Exception {
  GoogleSignInExc(this.massage);
  final String? massage;

  @override
  String toString() {
    return massage ?? '';
  }
}
