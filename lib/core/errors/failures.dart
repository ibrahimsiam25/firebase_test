abstract class Failure {
  final String message;
  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);
}

class CustomException implements Exception {
  final String message;
  CustomException({required this.message});
  @override
  String toString() => message;
}
