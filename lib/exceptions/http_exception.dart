class HttpException implements Exception {
  @override
  String toString() {
    return 'City not found, please try to change your search query';
  }
}
