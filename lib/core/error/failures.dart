abstract class Failure {}

// General failures
class ServerFailure extends Failure {
  final String? message;

  ServerFailure({this.message});
}

class CacheFailure extends Failure {}
