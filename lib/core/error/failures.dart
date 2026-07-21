import 'package:equatable/equatable.dart';

/// Failures are what the DOMAIN and PRESENTATION layers deal with.
/// They never know about DioError, SocketException, PlatformException, etc.
/// The DATA layer's job is to catch those low-level exceptions and translate
/// them into one of these.
abstract class Failure extends Equatable {
  final String message;
  const Failure(this.message);

  @override
  List<Object?> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure([super.message = 'Something went wrong on the server.']);
}

class ProcessFailure extends Failure {
  const ProcessFailure([super.message = 'Something went wrong.']);
}

class NetworkFailure extends Failure {
  const NetworkFailure([super.message = 'No internet connection.']);
}

class JsonFailure extends Failure {
  const JsonFailure([super.message = 'failed parsing json']);
}

class InvalidCredentialsFailure extends Failure {
  const InvalidCredentialsFailure([
    super.message = 'Email or password is incorrect.',
  ]);
}

class UnknownFailure extends Failure {
  const UnknownFailure([super.message = 'Unexpected error occurred.']);
}
