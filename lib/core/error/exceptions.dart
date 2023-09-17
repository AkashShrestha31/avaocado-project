class ServerException implements Exception {
  String? _message;

  ServerException([String message = 'Invalid value']) {
    _message = message;
  }

  @override
  String toString() {
    return _message ?? '';
  }
}

class CacheException implements Exception {}
