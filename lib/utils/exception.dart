class ServerException implements Exception {
  final String message;

  ServerException(this.message);
}

class NotFoundException implements Exception {
  final String message;

  NotFoundException(this.message);
}

class DatabaseException implements Exception {
  final String message;

  DatabaseException(this.message);
}

class ConnectionException implements Exception {
  final String message;

  ConnectionException(this.message);
}

class CacheException implements Exception {
  final String message;

  CacheException(this.message);
}

class AllowException implements Exception {
  final String message;

  AllowException(this.message);
}
